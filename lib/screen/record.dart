import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:flutter_sound/public/flutter_sound_player.dart';
import 'package:microphone/microphone.dart'; // 추가
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';




class RecordingEditPage extends StatefulWidget {
  @override
  _RecordingEditPageState createState() => _RecordingEditPageState();
}

class _RecordingEditPageState extends State<RecordingEditPage> {
  List<String> recordings = [];
  late FlutterSoundPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = FlutterSoundPlayer();
    checkAndRequestMicrophonePermission();
    // recordings 초기화
    recordings = [
      '녹음 파일 경로 1',
      '녹음 파일 경로 2',
      '녹음 파일 경로 3',
    ];
  }

  void checkAndRequestMicrophonePermission() async {
    PermissionStatus status = await Permission.microphone.status;

    if (!status.isGranted) {
      status = await Permission.microphone.request();
    }

    if (!status.isGranted) {
      // Handle microphone permission denied or not granted
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: AppBar(
          title: Padding(
            padding: EdgeInsets.only(top: 15.0),
            child: Text(
              '녹음 수정',
              style: TextStyle(
                fontSize: 45.0,
              ),
            ),
          ),
          centerTitle: true,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(16.0, 15.0, 16.0, 80.0),
        child: recordings.isEmpty
            ? Center(child: Text('녹음된 파일이 없습니다.'))
            : ListView.builder(
          itemCount: recordings.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Card(
                elevation: 4.0,
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '녹음 ${index + 1}',
                        style: TextStyle(fontSize: 30.0),
                      ),
                      SizedBox(height: 16.0),
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildActionButton(
                            icon: Icons.play_arrow,
                            label: '녹음 재생',
                            onPressed: () {
                              _playRecording(index);
                            },
                          ),
                          _buildActionButton(
                            icon: Icons.edit,
                            label: '녹음 수정',
                            onPressed: () async {
                              String? recordedFilePath =
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      RecordingScreen(),
                                ),
                              );
                              if (recordedFilePath != null) {
                                setState(() {
                                  recordings.add(recordedFilePath);
                                });
                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 30.0),
        child: SizedBox(
          width: 250.0,
          height: 60.0,
          child: ElevatedButton(
            onPressed: _saveRecordings,
            child: Text(
              '저장',
              style: TextStyle(fontSize: 24.0),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton(
      {required IconData icon,
        required String label,
        required VoidCallback onPressed}) {
    return TextButton.icon(
      icon: Icon(icon, size: 32.0),
      label: Text(
        label,
        style: TextStyle(fontSize: 24.0),
      ),
      onPressed: onPressed,
    );
  }

  void _playRecording(int index) {
    String path = recordings[index];
    if (path.isNotEmpty) {
      _audioPlayer.startPlayer(fromURI: path).then((value) {
        print('Recording is playing.');
      }).catchError((error) {
        print('Error playing recording: $error');
      });
    } else {
      print('Recording path is empty.');
    }
  }

  void _saveRecordings() async {
    final directory = await getApplicationDocumentsDirectory();
    for (String path in recordings) {
      if (path.isNotEmpty) {
        String fileName = path.split('/').last;
        String newPath = '${directory.path}/$fileName';
        await File(path).copy(newPath); // File 클래스 사용 시 dart:io 패키지 사용
      }
    }
    print('Recordings saved to document directory.');
  }
}

class RecordingScreen extends StatefulWidget {
  @override
  _RecordingScreenState createState() => _RecordingScreenState();
}

class _RecordingScreenState extends State<RecordingScreen> {
  late MicrophoneRecorder _recorder;
  bool _isRecording = false;
  late String _recordedFilePath;

  @override
  void initState() {
    super.initState();
    _recorder = MicrophoneRecorder();
    _initMicrophone();
  }

  Future<void> _initMicrophone() async {
    try {
      await _recorder.init();
    } catch (e) {
      print('Error initializing microphone: $e');
    }
  }

  void _toggleRecording() async {
    if (!_isRecording) {
      await _startRecording();
    } else {
      await _stopRecording();
    }
    setState(() {
      _isRecording = !_isRecording;
    });
  }

  Future<void> _startRecording() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      _recordedFilePath = '${directory.path}/my_recording.wav';

      await _recorder.start();

      Uri recordedFileUri = Uri.file(_recordedFilePath);

      setState(() {
        _isRecording = true;
        _recordedFilePath = recordedFileUri.toString();
      });
    } catch (e) {
      print('Error starting recording: $e');
    }
  }

  Future<void> _stopRecording() async {
    try {
      await _recorder.stop();
      setState(() {
        _isRecording = false;
      });
      print('Recording stopped. File saved at: $_recordedFilePath');
      Navigator.pop(context, _recordedFilePath);
    } catch (e) {
      print('Error stopping recording: $e');
    }
  }

  @override
  void dispose() {
    _recorder.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(
                _isRecording ? Icons.stop : Icons.fiber_manual_record,
                size: 100.0,
                color: !_isRecording ? Colors.red : null,
              ),
              onPressed: _toggleRecording,
            ),
            SizedBox(height: 20.0),
            Text(
              _isRecording ? '녹음 중지' : '녹음 시작',
              style: TextStyle(
                fontSize: 40.0,
                color: !_isRecording ? Colors.red : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

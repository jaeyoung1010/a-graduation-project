import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class RecordingScreen extends StatefulWidget {
  @override
  _RecordingScreenState createState() => _RecordingScreenState();
}

class _RecordingScreenState extends State<RecordingScreen> {
  FlutterSoundRecorder? _recorder;
  FlutterSoundPlayer? _player;
  bool _isRecording = false;
  String? _filePath;

  @override
  void initState() {
    super.initState();
    _recorder = FlutterSoundRecorder();
    _player = FlutterSoundPlayer();
    _initializeRecorder();
    _initializePlayer();
  }

  Future<void> _initializeRecorder() async {
    await _recorder!.openRecorder();
  }

  Future<void> _initializePlayer() async {
    await _player!.openPlayer();
  }

  @override
  void dispose() {
    _recorder!.closeRecorder();
    _player!.closePlayer();
    super.dispose();
  }

  Future<void> _startRecording() async {
    Directory tempDir = await getTemporaryDirectory();
    String path = '${tempDir.path}/flutter_sound.aac';
    setState(() {
      _filePath = path;
    });
    await _recorder!.startRecorder(toFile: path);
    setState(() {
      _isRecording = true;
    });
  }

  Future<void> _stopRecording() async {
    await _recorder!.stopRecorder();
    setState(() {
      _isRecording = false;
    });
  }

  Future<void> _uploadFile() async {
    if (_filePath != null) {
      File file = File(_filePath!);
      try {
        await FirebaseStorage.instance
            .ref('uploads/${DateTime.now().millisecondsSinceEpoch}.aac')
            .putFile(file);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('File uploaded successfully!')),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('File upload failed: $e')),
        );
      }
    }
  }

  Future<void> _playRecording() async {
    if (_filePath != null) {
      await _player!.startPlayer(fromURI: _filePath);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('녹음하기'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _isRecording ? _stopRecording : _startRecording,
              child: Text(_isRecording ? '녹음 중지' : '녹음 하기'),
            ),
            ElevatedButton(
              onPressed: _playRecording,
              child: Text('녹음한 파일 듣기'),
            ),
            ElevatedButton(
              onPressed: _uploadFile,
              child: Text('녹음한 파일 저장'),
            ),
          ],
        ),
      ),
    );
  }
}

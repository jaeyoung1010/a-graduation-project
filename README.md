# Silver Touch

**Silver Touch**는 고령 사용자의 일상과 안전을 돕기 위해 제작한 Flutter 기반 졸업 프로젝트입니다. 큰 글씨와 큰 터치 영역, 단순한 화면 구조를 중심으로 설계했으며, 복지 정보 탐색·비상연락처·모임·녹음 기능을 한 앱에 담았습니다.

![Silver Touch 로고](asset/images/logo.png)

## 디자인 방향

- 검은 시작 화면 위에 로고와 제작자 정보를 배치해 진입점을 단순화했습니다.
- 하늘색을 주요 강조색으로 사용하고, 홈의 핵심 메뉴를 큰 버튼으로 만들었습니다.
- 큰 한글 텍스트와 넉넉한 여백을 사용해 고령 사용자가 읽고 누르기 쉽게 했습니다.
- 홈 화면에는 어르신의 생활 장면을 담은 이미지 슬라이드를 3초 간격으로 자동 전환합니다.

![홈 슬라이드 예시](asset/images/image1.png)

## 주요 화면 흐름

```text
시작 로고
  └─ Firebase 로그인 / 회원가입
       └─ 홈
            ├─ 비상연락처 목록
            ├─ 오늘의 모임
            ├─ 노인복지 정보
            │    ├─ 노인 복지 기관
            │    ├─ 주변 복지관
            │    └─ 치매 예방 정보
            └─ 녹음
```

## 구현된 기능

| 영역 | 현재 구현 |
| --- | --- |
| 인증 | Firebase Authentication을 이용한 이메일/비밀번호 회원가입 및 로그인 |
| 비상연락처 | 이름, 관계, 전화번호, 주소를 Cloud Firestore의 `addcontact` 컬렉션에 저장하고 목록으로 조회 |
| 홈 | 이미지 캐러셀, 비상연락처 진입, 큰 메뉴 버튼, 기기 흔들기 감지 카운터 |
| 모임 | 샘플 모임 4개를 보여주고 참여/취소에 따라 화면상의 참여 인원을 변경 |
| 복지 정보 | 노인복지 기관 5곳과 복지관 10곳의 소개 및 기관 웹사이트 링크 |
| 치매 정보 | 대한치매협회 소개 및 외부 링크 |
| 녹음 | 녹음 시작/중지, 재생, Firebase Storage 업로드 |
| 추가 화면 | 휴대폰 인증형 가입 화면, 기본 회원정보 수정 화면 |

## 기술 구성

- Flutter / Material UI
- Firebase Core, Authentication, Cloud Firestore, Storage
- `shake`: 흔들기 감지
- `flutter_sound`: 녹음 및 재생
- `url_launcher`: 복지기관 웹사이트 열기

## 실행 전 확인 사항

Firebase 설정 파일은 Android, iOS, macOS용으로 포함되어 있습니다. 의존성을 설치한 뒤 지원되는 기기에서 실행합니다.

```bash
flutter pub get
flutter run
```

## 현재 소스의 보완 필요 사항

이 저장소는 졸업 프로젝트 당시의 프로토타입을 보존한 것입니다. 재실행·배포 전에는 아래 항목을 점검해야 합니다.

1. 녹음 권한: Android의 `RECORD_AUDIO` 권한과 iOS의 `NSMicrophoneUsageDescription`이 없어 실제 기기 녹음이 실패할 수 있습니다.
2. 치매 메뉴: 2~5번 항목이 존재하지 않는 `assets/images/...` 경로를 사용합니다. 첫 항목만 정상적으로 구성되어 있습니다.
3. 가입 흐름: 회원가입과 비상연락처 저장 뒤의 화면 전환이 자연스럽지 않아 재정리해야 합니다.
4. 데이터 지속성: 홈의 사용자명, 걸음 수, 모임 데이터는 하드코딩 또는 화면 상태이며 사용자 데이터로 저장되지 않습니다.
5. 개인정보 보호: 비상연락처 문서에 사용자 ID가 연결되어 있지 않습니다. Firestore 보안 규칙과 사용자별 데이터 분리가 필요합니다.
6. 미완성 화면: 휴대폰 문자 인증, 주소 검색, 회원정보 저장, 박수 소리 설정은 화면만 있고 실제 동작이 연결되지 않았습니다.

## 주요 소스 위치

- 앱 시작, 인증: `lib/main.dart`
- 홈 및 흔들기 카운터: `lib/screen/mainpage.dart`
- 비상연락처: `lib/screen/addcontact.dart`, `lib/screen/contactlist.dart`
- 복지·복지관·치매 정보: `lib/screen/information_on_the_elderly.dart`, `lib/screen/welfare.dart`, `lib/screen/welfarecenter.dart`, `lib/screen/dementia.dart`
- 녹음: `lib/screen/record.dart`

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="resources/logos/claude-howto-logo-dark.svg">
  <img alt="Claude How To" src="resources/logos/claude-howto-logo.svg">
</picture>

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Claude Code](https://img.shields.io/badge/Claude_Code-2.1.302-purple)](https://code.claude.com)
[![Spring Boot](https://img.shields.io/badge/practice-Spring_Boot_4-6DB33F)](ko/practice/board-api/README.md)

🌐 **언어:** [한국어](README.md) | [English](README.en.md) | [Tiếng Việt](vi/README.md) | [中文](zh/README.md) | [Українська](uk/README.md) | [日本語](ja/README.md)

# Claude Code 한국어 학습 가이드

> **Spring Boot로 백엔드 취업을 준비하는 입문자를 위한 Claude Code 실습서**
>
> 그림으로 개념을 잡고, 실제 Spring Boot 프로젝트에서 실습하고, 퀴즈로 확인합니다.
> 끝까지 따라 하면 **처음 보는 코드를 파악하고, 안전하게 고치고, 반복 작업을 자동화하고, 이슈·PR·CI 흐름에 맞춰 일하는 법**을 익힐 수 있어요.

**[👉 바로 시작하기](#-시작하기)** · **[🧭 학습 순서](#-학습-순서)** · **[📖 공부하는 방법](#-공부하는-방법)** · **[❔ 자주 묻는 질문](#-자주-묻는-질문)**

![Claude Code 기능 지도](ko/images/00-feature-map.svg)

---

## 📌 이 저장소는

[luongnv89/claude-howto](https://github.com/luongnv89/claude-howto) (Claude Code 학습 자료, MIT 라이선스)를 바탕으로, **한국어 학습 가이드(`ko/`)** 를 더한 저장소예요.

| | 원본 (영어) | 이 저장소의 한국어 가이드 |
|---|---|---|
| 대상 | Claude Code를 쓰는 모든 개발자 | **백엔드 취업을 준비하는 입문자** |
| 구성 | 기능 설명 중심 레퍼런스 | **그림 → 실습 → 퀴즈 → 실무 활용** 중심 학습서 |
| 예제 | 장마다 따로 노는 예제 | **하나의 Spring Boot 프로젝트**를 0장부터 끝까지 고쳐 나감 |
| 결과물 | 설정 파일 | 설정 파일 + **포트폴리오 문서와 면접 답변** |

---

## 🎯 끝까지 하면 얻는 것

- **실무 능력:** 처음 받은 Spring Boot 프로젝트를 Claude Code로 빠르게 파악하고, 버그 수정·테스트 작성·코드 리뷰를 맡기고 결과를 검토할 수 있어요.
- **나만의 도구:** 반복하는 일을 슬래시 명령, 스킬, 훅, 리뷰 에이전트로 만들어 내 방식대로 쓸 수 있어요.
- **협업 경험:** GitHub 이슈 → 브랜치 → PR → CI 흐름을 직접 해 봐요.
- **포트폴리오:** 트러블슈팅 문서(N+1 개선 등), 테스트 코드, CI 설정, 졸업 프로젝트 저장소가 남아요.
- **면접 준비:** 장마다 "면접에서 이렇게 말해 보세요"와 예상 꼬리 질문이 있어요.

### 이런 분께 맞아요

| ✅ 맞아요 | ❌ 다른 자료가 나아요 |
|---|---|
| Java·Spring을 공부 중인 백엔드 취업 준비생 | Java를 처음 배우는 분 (Java 기초부터 먼저) |
| Claude Code를 처음 쓰거나 대화만 해 본 분 | Claude Code 고급 설정만 빠르게 찾는 분 → [영어 원본](README.en.md) |
| 읽기보다 직접 해 보며 배우는 걸 좋아하는 분 | |

---

## 🚀 시작하기

### 준비물

| 준비물 | 설명 |
|---|---|
| **Claude 유료 플랜** | Pro, Max 구독 또는 API 키. 무료 플랜으로는 Claude Code를 쓸 수 없어요 |
| **Git** | Windows는 [Git for Windows](https://git-scm.com/downloads/win) 설치. 함께 설치되는 **Git Bash**로 실습해요 |
| **JDK 21** | 실습 프로젝트 실행용 |
| **에디터** | IntelliJ IDEA 또는 VS Code |

### 3단계로 시작

**1. 이 저장소를 내려받아요.**

```bash
git clone https://github.com/Hanjise0ng/claude-howto.git ~/claude-howto
```

**2. 학습 가이드 첫 화면을 열어요.**

[ko/README.md](ko/README.md)에서 **수준 확인 체크리스트**를 풀고 시작할 장을 정하세요. 처음이라면 무조건 0장부터예요.

**3. [0장. 시작 전 준비](ko/00-getting-started/README.md)를 따라 해요.**

Claude Code 설치, 실습 프로젝트 준비, 첫 대화까지 1시간이면 끝나요.

> 💡 실습은 이 저장소 안이 아니라 **복사한 실습 프로젝트(`~/board-api`)** 에서 해요. 0장에서 방법을 안내해요.

---

## 🧭 학습 순서

**폴더 번호(원문의 장 번호)대로가 아니라 아래 순서대로** 공부하세요. 앞 장에서 만든 결과물을 다음 장에서 이어서 써요.

### 🟢 1단계: Claude와 안전하게 일하기 (약 5시간)

| 순서 | 장 | 배우는 것 | 실습에서 하는 일 |
|---|---|---|---|
| 1 | [0장 시작 전 준비](ko/00-getting-started/README.md) | 설치, 첫 대화, 좋은 부탁 쓰는 법 | 처음 받은 프로젝트 구조 파악 |
| 2 | [1장 슬래시 명령](ko/01-slash-commands/README.md) | `/` 명령, 나만의 명령 만들기 | 500 에러를 404로 고치기 |
| 3 | [2장 메모리](ko/02-memory/README.md) | CLAUDE.md, 팀 규칙 저장 | 팀 규칙·실행 방법 적어 두기 |
| 4 | [8장 체크포인트와 안전장치](ko/08-checkpoints/README.md) | 되돌리기, 계획 모드, 권한 모드 | 망치고 되돌리기, 계획부터 받기 |
| 5 | [10장 CLI ① 기초](ko/10-cli/README.md#part-1-기초) | `claude -p`, 파이프 | 에러 로그 분석 |

> 🎉 **1단계만 끝내도 실무에서 바로 쓸 수 있어요.**

### 🔵 2단계: 반복 작업 자동화 (약 5시간)

| 순서 | 장 | 배우는 것 | 실습에서 하는 일 |
|---|---|---|---|
| 6 | [3장 스킬](ko/03-skills/README.md) | 업무 매뉴얼 만들기 | 테스트 먼저 쓰고 버그 고치기(TDD) |
| 7 | [6장 훅](ko/06-hooks/README.md) | "~할 때마다 자동으로" | 수정마다 자동 컴파일, 위험 명령 차단 |
| 8 | [4장 서브에이전트](ko/04-subagents/README.md) | 일을 나눠 맡기기 | 보안 리뷰로 비밀번호 암호화 |
| 9 | [5장 MCP](ko/05-mcp/README.md) | GitHub 등 외부 서비스 연결 | 이슈 → 브랜치 → PR |

### 🔴 3단계: 실무 수준으로 (약 5시간 + 졸업 프로젝트)

| 순서 | 장 | 배우는 것 | 실습에서 하는 일 |
|---|---|---|---|
| 10 | [9장 고급 기능](ko/09-advanced-features/README.md) | 계획 모드 심화, auto 모드 | N+1 문제 개선 |
| 11 | [10장 CLI ② 심화](ko/10-cli/README.md#part-2-심화) | GitHub Actions | PR마다 테스트·리뷰 자동화 |
| 12 | [7장 플러그인](ko/07-plugins/README.md) *(선택)* | 내 도구를 한 묶음으로 | 개발 도구 플러그인 배포 |
| 🎓 | [졸업 프로젝트](ko/graduation/README.md) | 전부 활용 | 내 포트폴리오 프로젝트를 처음부터 |

**왜 이 순서인가요?** 안전장치(8장)를 일찍 배워야 마음 놓고 실험할 수 있고, 준비물이 필요 없는 서브에이전트(4장)를 GitHub 인증이 필요한 MCP(5장)보다 먼저 해요. 자세한 이유는 [ko/README.md](ko/README.md#왜-이-순서인가요)에 있어요.

### 📅 추천 일정 (하루 1~2시간)

| 주차 | 범위 | 목표 |
|---|---|---|
| 1주차 | 1단계 (0 → 1 → 2 → 8 → 10장 ①) | Claude에게 안전하게 일 시키기 |
| 2주차 | 2단계 (3 → 6 → 4 → 5장) | 반복 작업 자동화, 이슈·PR 흐름 |
| 3주차 | 3단계 (9 → 10장 ② → 7장) | 성능 개선, CI 자동화 |
| 4주차~ | 졸업 프로젝트 | 내 포트폴리오 완성 |

하루에 한 장을 다 못 끝내도 괜찮아요. **"미션 하나 끝내고 커밋하기"** 를 하루 목표로 잡으세요.

---

## 📖 공부하는 방법

### 모든 장은 같은 6단계로 되어 있어요

| 단계 | 할 일 | 시간 | 이렇게 하세요 |
|---|---|---|---|
| 🖼️ **1. 그림 보기** | 개념 그림과 비유 | 5분 | "이 기능이 뭘 하는지" 한 문장으로 말할 수 있으면 충분 |
| 📖 **2. 핵심 개념** | STEP 2의 표만 읽기 | 10분 | 외우지 말고 "이런 게 있구나" 정도로 |
| 🛠️ **3. 실습 미션** | 🟢 기본 → 🔵 응용 → 🔴 도전 | 30~60분 | **가장 중요해요.** 반드시 직접 실행 |
| ❓ **4. 퀴즈** | 장 안의 5문제 + `/ko-quiz` 8문제 | 10분 | 6점 이하면 틀린 부분의 미션을 다시 |
| 🏢 **5. 현장 레시피** | 실무에서 쓰는 부탁 예시 | 5분 | 마음에 드는 건 내 스킬로 저장 |
| 🎤 **6. 면접 한마디** | 배운 것을 내 경험으로 말하기 | 5분 | 내 말로 바꿔서 메모 |

### 실습할 때 꼭 지킬 5가지

1. **Windows는 Git Bash로.** PowerShell은 `&&`, `curl`, `mkdir -p`가 다르게 동작해요.
2. **Manual 모드(⏸)를 유지하기.** Claude가 무엇을 바꾸는지 하나하나 보는 것 자체가 공부예요.
3. **Claude가 고친 코드는 `/diff`로 확인하기.** 이해가 안 되는 줄은 "이 줄 왜 이렇게 했어?"라고 물어보세요.
4. **망쳐도 괜찮아요.** `Esc` 두 번으로 되돌리고, 그래도 안 되면 `git restore`로 돌아가요.
5. **미션이 끝날 때마다 `git commit`.** 커밋 기록이 곧 학습 기록이고 포트폴리오예요.

### 막혔을 때

```text
1. 미션 아래 "🔍 힌트" 열어 보기
2. Claude에게 에러 메시지째 물어보기 ("이 에러를 신입 눈높이로 설명해 줘")
3. 모르는 단어는 용어집(ko/glossary.md)에서 찾기
4. 그래도 안 되면 참고 풀이(ko/practice/solutions.md) 보기. 단, 미션을 해 본 뒤에만
```

### 이해했는지 판단하는 기준

| 상태 | 판단 |
|---|---|
| 문서를 읽고 고개를 끄덕였다 | ❌ 아직 아니에요 |
| 미션을 그대로 따라 해서 성공했다 | 🔺 절반 |
| 🔴 도전 미션처럼 **다른 상황에 응용**하고, **왜 그렇게 하는지 설명**할 수 있다 | ✅ 이해했어요 |

> 🎯 **가장 중요한 원칙:** Claude가 만든 코드를 **내 말로 설명할 수 없으면, 그 코드는 아직 내 것이 아니에요.** 설명이 막히는 곳이 바로 다음 공부 주제예요.

---

## 🧪 실습 프로젝트: board-api

![board-api 구조](ko/images/00-board-api-layers.svg)

회원, 게시글, 댓글 기능이 있는 **Spring Boot 4 + JPA + H2** 게시판 API예요. 신입이 처음 받는 코드처럼 **고쳐야 할 문제 5개가 일부러 숨어 있어요.**

| # | 숨은 문제 (힌트) | 고치는 장 |
|---|---|---|
| 1 | 없는 게시글을 조회하면 이상한 에러가 나요 | 1장 |
| 2 | 테스트 코드가 사실상 없어요 | 3장 |
| 3 | 제목이 빈 게시글도 저장돼요 | 3장 |
| 4 | 회원 정보를 저장하는 방식이 위험해요 | 4장 |
| 5 | 목록을 한 번 조회하는데 SQL이 너무 많이 실행돼요 | 9장 |

👉 [실습 프로젝트 안내](ko/practice/board-api/README.md) · [참고 풀이](ko/practice/solutions.md) (미션을 해 본 뒤에 보세요)

---

## ❓ 퀴즈로 실력 확인하기

이 저장소 폴더에서 `claude`를 켜고 입력하세요.

| 명령 | 하는 일 |
|---|---|
| `/ko-quiz 1` | 한국어 가이드 1장 퀴즈 8문제를 내고 채점, 복습할 곳을 알려 줘요. 장 번호는 `0`~`9`, `10-1`, `10-2` |
| `/self-assessment` | 원본의 전체 실력 진단 (영어) |
| `/lesson-quiz hooks` | 원본 모듈별 퀴즈 (영어) |

---

## 📁 저장소 구조

```text
claude-howto/
├── README.md                 ← 지금 보는 문서 (한국어)
├── README.en.md              ← 원본 영어 소개
├── ko/                       ← ⭐ 한국어 학습 가이드
│   ├── README.md             ← 학습 가이드 시작 화면
│   ├── glossary.md           ← 용어집
│   ├── 00-getting-started/   ← 0장
│   ├── 01-slash-commands/ … 10-cli/   ← 각 장 + 복사용 템플릿
│   ├── graduation/           ← 졸업 프로젝트
│   ├── practice/             ← 실습 프로젝트 board-api, 참고 풀이
│   └── images/               ← 개념 그림
├── 01-slash-commands/ … 10-cli/   ← 원본 영어 모듈 (심화 레퍼런스)
├── .claude/skills/           ← 퀴즈 스킬 (ko-quiz, lesson-quiz, self-assessment)
└── ja/ vi/ zh/ uk/           ← 다른 언어 번역
```

### 영어 원본은 언제 보나요?

한국어 가이드는 입문자에게 필요한 것만 골라 쉽게 다시 썼어요. 각 장 끝의 **"📚 더 알아보기"** 에 원본 영어 모듈 링크가 있어요. 이럴 때 원본을 보세요.

- 모든 옵션과 설정 키를 찾아볼 때 (예: 훅 이벤트 30개 전체)
- 버전별 변경 사항을 확인할 때
- 기업용·관리자 설정이 필요할 때

영어가 부담되면 Claude에게 "이 문서의 ○○ 부분을 한국어로 요약해 줘"라고 부탁하세요.

---

## ❔ 자주 묻는 질문

<details>
<summary><b>코딩을 거의 몰라도 할 수 있나요?</b></summary>

Java 문법과 Spring의 기본 개념(Controller, Service, Repository)을 들어 본 정도면 충분해요. 실습 프로젝트 코드는 0장에서 Claude와 함께 하나씩 읽어 가요. Java를 처음 배우는 단계라면 Java 기초를 먼저 공부하는 게 좋아요.

</details>

<details>
<summary><b>무료로 할 수 있나요?</b></summary>

Claude Code는 Pro, Max 같은 **유료 구독** 또는 API 키가 필요해요. 10장 ②의 CI 자동 리뷰 미션은 API 키가 따로 필요하고 쓰는 만큼 요금이 나가요(선택 미션이에요).

</details>

<details>
<summary><b>Mac에서도 되나요?</b></summary>

네. 모든 명령이 bash 기준이라 Mac 터미널에서 그대로 따라 하면 돼요. Windows만 Git Bash를 쓰면 돼요.

</details>

<details>
<summary><b>AI에게 맡기면 실력이 안 늘지 않나요?</b></summary>

그래서 모든 미션에 "내 말로 설명하기"와 "면접 한마디"가 있어요. 이 가이드의 목표는 AI가 대신 코딩하게 하는 게 아니라, **AI 결과를 검증하고 설명할 수 있는 개발자**가 되는 거예요. 테스트 먼저 쓰기(3장), 변경 검토(8장), 리뷰(4장)도 그래서 들어 있어요.

</details>

<details>
<summary><b>시간이 얼마나 걸리나요?</b></summary>

하루 1~2시간이면 1단계 1주, 2단계 1주, 3단계 1주, 졸업 프로젝트 1~2주 정도예요. 1단계만 끝내도 실무에서 바로 쓸 수 있어요.

</details>

---

## 🔄 원본 업데이트 받기

이 저장소는 원본을 `upstream`으로 연결해 두었어요. 원본에 새 내용이 생기면 이렇게 받아와요.

```bash
git fetch upstream
git merge upstream/main
```

원본이 영어 `README.md`를 바꾸면 이 한국어 README와 충돌할 수 있어요. 그때는 한국어 README는 그대로 두고, 원본의 새 내용은 `README.en.md`에 옮겨 주세요.

---

## 📜 출처와 라이선스

- 원본: [luongnv89/claude-howto](https://github.com/luongnv89/claude-howto) by Luong NGUYEN, [MIT License](LICENSE)
- 한국어 학습 가이드(`ko/`)는 원본 v2.1.302를 바탕으로 작성했어요.
- 이 저장소도 MIT License를 따라요. 자유롭게 쓰고, 고치고, 나눠도 되며 라이선스 고지만 포함하면 돼요.
- 공식 문서: [Claude Code Docs](https://code.claude.com/docs/en/overview)

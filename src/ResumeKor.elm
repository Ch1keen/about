module ResumeKor exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

import ResumeModel exposing (..)


-- STYLE

slate_100 : String
slate_100 =
    "rgb(241 245 249)"


slate_300 : String
slate_300 =
    "rgb(203 213 225)"


slate_400 : String
slate_400 =
    "rgb(148 163 184)"



-- VIEW

divider : Html Msg
divider =
    hr [ style "border-color" slate_300 ] []


contactLine : Html Msg -> String -> String -> Html Msg
contactLine title url label =
    p
        [ style "text-align" "center" ]
        [ title
        , span [ style "width" "1rem", style "display" "inline-block" ] []
        , a [ href url ] [ text label ]
        ]



section : String -> Context -> Html Msg -> Html Msg
section title context body =
    if context.isInteractable
    then
        div
            [ style "margin" "5rem auto"
            , style "break-inside" "avoid"
            ]
            [ h2 [] [ text title ], divider, body ]
    else
        div
            [ style "margin" "0 auto"
            , style "break-inside" "avoid"
            ]
            [ h2 [ style "margin-bottom" "2px"] [ text title ], divider, body ]


ch1keenTitleKor : Context -> Html Msg
ch1keenTitleKor context =
    let
        titleStyling =
            if context.isInteractable
            then [ style "padding-top" "48px", style "padding-bottom" "24px" ]
            else [ ]
    in
        div
            titleStyling
            [ h1 [ style "text-align" "center" ] [ text "한정준" ]
            , contactLine (text "\u{1f4e7}") "mailto:hire-me@ch1keen.xyz" "hire-me@ch1keen.xyz"
            , contactLine (img [ src "assets/github-mark.svg", width 24, height 24 ] []) "https://github.com/Ch1keen" "github.com/Ch1keen"
            , contactLine (text "\u{1f4dd}") "https://about.ch1keen.xyz/" "about.ch1keen.xyz"
            ]


ch1keenProfileKor : Context -> Html Msg
ch1keenProfileKor context =
    section "Profile" context
        (div []
            [ ul []
                [ li [] [ text "차량 제어기 모의해킹은 제 직업이고, 웹 서비스 개발과 해킹은 취미입니다." ]
                , li [] [ text "신기술과 최신 트렌드에 흥미진진 흥미를 느낍니다." ]
                , li [] [ text "여러 팀들과 더불어 팀원들과의 친목을 도모하고 소통하며 목표 달성을 노립니다." ]
                ]
            , p [] [ strong [] [ text "Keyword: " ]
                , text "Automotive, Penetration Testing, Reverse Engineering, UDS(ISO 14229-1), Cyber Security, UN R.155"
            ]
        ])


ch1keenCareerKor : Context -> Html Msg
ch1keenCareerKor context =
    section "Career" context
        (ul []
            [ li []
                [ text "2023.10 - present: 제어기 모의 해킹, "
                , a [ href "https://autocrypt.io" ] [ text "(주) 아우토크립트" ]
                , text " 레드팀"
                , ul []
                    [ li []
                        [ text "IVI(AVN), 클러스터, 텔레매틱스 등 "
                        , strong [] [ text "다양한 티어 사의 제어기 모의해킹 경험" ]
                        , text ". AUTOSAR 구조 제어기 및 Yocto 리눅스 기반 제어기에서 여러 이슈 제기하였음."
                        ]
                    , li []
                        [ strong [] [ text "현대모비스 품질 팀" ]
                        , text "과 진행한 과거차보안 협력 프로젝트에서 5개 제어기에서 11개의 이슈를 보고하였고, 이중 5개 이슈는 "
                        , strong [] [ text "사고로 분류" ]
                        , text "되어 "
                        , strong [] [ text "현대모비스 사장에 보고" ]
                        , text "됨. 이를 통해 고객사들과 함께 협업하는 방법에 대해 알게 되었음."
                        ]
                    , li []
                        [ strong [] [ text "SPI 테스트:" ]
                        , text " 클러스터 제어기 기판 위에 노출된 SOIC-8 칩 SPI 라인에 장치를 연결하여 NvM 데이터 덤프를 시도하는 테스트를 수행."
                        ]
                    , li []
                        [ strong [] [ text "V2X(Vehicle-to-Everying) 테스팅:" ]
                        , text " 주어진 TARA에 따라 테스트 플랜을 설계하고 CAM/DENM, BSM 통신 컴포넌트를 리버스 엔지니어링하는 방식으로 V2X 프로토콜에 대한 테스트를 수행하였음."
                        ]
                    , li [] [ text "유럽향 차종의 VTA 인증에 인터뷰이 자격으로 참여하였음. CAN/UDS (ISO/SAE 14229-1) 컴포넌트와 미디어 처리 컴포넌트에 취약점이 없었음을 설명함." ]
                    ]
                ]
            , li []
                [ text "2020.10 - 2021.02: 어플리케이션 개발 인턴, PETNER. Co,.Ltd."
                , ul []
                    [ li [] [ text "댓글, 좋아요 기능이 있는 커뮤니티 서비스 론칭. 기술 스택: Ruby on Rails, Flutter" ]
                    , li [] [ text "대회나 취약점 찾기 등 침투 테스트를 수행할 때 개발자의 측면을 고려하게 된 계기가 되었음." ]
                    ]
                ]
            , li []
                [ text "2019.03 - 2020.10: 대한민국 육군 정보보호병"
                , ul []
                    [ li [] [ text "예하 사단에서 발생한 보안 사고를 탐지 및 제보." ]
                    , li [] [ text "분대장으로써 팀원들의 화합을 도모하고 주어진 임무를 수행." ]
                    ]
                ]
            , li []
                [ text "2021.01 - 2022.06: "
                , a [ href "https://sites.google.com/view/ksel/about/mission-history" ] [ text "경기대학교 차세대 보안공학 연구실(NSE Lab)" ]
                , text "학부연구생"
                , ul []
                    [ li [] [ text "블록체인 기술과 스마트 컨트랙트에서 발생할 수 있는 취약점에 대해 연구함." ]
                    , li [] [ text "이더리움 dApp의 코인 이코노미와 서비스에서 발생할 수 있는 취약점에 대해 학습." ]
                    ]
                ]
            , li []
                [ text "Key Projects"
                , ul []
                    [ li []
                      [ a [ href "https://github.com/dia-language" ] [ text "Dia programming language" ]
                      , text " (2024): OCaml으로 작성된 강 타입(Strong Typed) 함수형 프로그래밍 언어 컴파일러(Dia -> C++) 프로젝트. "
                      , a [ href "" ] [ text "Yocto 레시피" ]
                      , text " 사용 가능." ]
                    , li []
                      [ a [ href "https://wiki.ch1keen.xyz/" ] [ text "Ch1keen Wiki" ]
                      , text " (2023): 차량 보안을 비롯한 여러 보안 관련 정보를 기록하고 전달하기 위해 Next.js를 이용한 사이트 운영 중." ]
                    , li []
                      -- The Hacking Championship Jr. 2023 (DSEC2023 in Daegu)
                      -- 제9회 정보보안 경진대회 (Ministry of Education)
                      [ text "CTF 문제 출제 (대구 DSEC2023, 제9회 정보보안 경진대회): 2 Cryptography, 1 Pwn, 1 Web 문제 출제. "
                      , a [ href "https://www.stealien.com/en/main" ] [ text "STEALIEN" ]
                      , text "과의 협업의 일환."
                      ]
                    , li []
                      -- BISC CTF 2023
                      [ a [ href "https://dreamhack.io/wargame/challenges/1003" ] [ text "CTF 문제 1개 출제 (BISC CTF)" ]
                      , text " (2023): "
                      , a [ href "https://nvd.nist.gov/vuln/detail/CVE-2018-14665" ] [ text "CVE-2018-14665" ]
                      , text "에서 영감을 받았으며, '재밌다'는 평가가 있었음."
                      ]
                    , li []
                        [ text "DevSecOps 컨테이너 관리 도구 (2022): 컨테이너 이미지에 서명을 추가하고 취약점을 스캐닝하는 도구. 파이썬으로 작성되었고, "
                        , a [ href "https://github.com/team-saba" ] [ text "오픈소스 공개함." ]
                        ]
                    ]
                ]
            ])


ch1keenAwardKor : Context -> Html Msg
ch1keenAwardKor context =
    section "Awards and Recognitions" context
        (ul []
            [ li [] [ text "2025 전라남도 웹보안 경진대회 - 우수상" ]
            , li []
                [ text "Def Con Car Hacking Village (2024) - "
                , strong [] [ text "종합 4위" ]
                , ul []
                    [ li [] [ text "AutoCrypt 레드팀 팀원들과 출전하였고, RAMN 도구를 이용한 문제에 집중." ]
                    , li [] [ text "리버스 엔지니어링을 통해 문제 해결의 실마리를 제공하였고, 문제 해결에 필요한 적절한 도구를 찾아내었음." ]
                    , li [] [ text "토요타 US 출신 출제진들을 비롯하여 타 문제 스태프들과도 소통하여 여러 힌트를 이끌어내어 팀에 기여함." ]
                    ]
                ]
            , li []
                [ a [ href "https://www.dsta.gov.sg/whats-on/spotlight/decoding-the-future-with-bright-minds" ] [ text "2023 Brainhack CDDC 2023 CTF (싱가포르)"
                , text " - "
                , strong [] [ text "본선 20위" ]
                ]
            , li []
                -- Archive: https://web.archive.org/web/20240717214739/https://hacktheon.org/2023/
                [ a [ href "https://hacktheon.org/2023/" ] [ text "2023 핵테온 세종 국제 대학생 사이버보안 경진대회" ]
                , text " - "
                , strong [] [ text "본선 21위" ]
                ]
            , li []
                [ text "2021 KOSPO 웹보안 경진대회"
                , text " - "
                , strong [] [ "장려상" ]
                ]
            , li []
                [ text "2020 TS 보안 경진대회 '보안 허점을 찾아라'"
                , text " - "
                , strong [] [ text "우수상" ]
                ]
            , li [] [ text "헌혈유공패 은장" ]
            ])


ch1keenEducationKor : Context -> Html Msg
ch1keenEducationKor context =
    section "Education & Training" context
        (ul []
            [ li [] [ a [ href "https://gcc.ac/archive/gcc_2023/" ] [ text "2023.02: Global Cyber Security 2023 교육 프로그램의 일환으로 싱가포르에서 연수함." ] ]
            , li [] [ text "2022.06 - 2023.03: KITRI Best of the Best - 11기 취약점 분석 트랙" ]
            , li []
                [ text "2017.03 - 2023.02: 경기대학교"
                , ul []
                    [ li [] [ text "융합보안학과" ]
                    , li [] [ text "전자공학과" ]
                    , li [] [ text "(학점 3.91/4.5; 복수전공)" ]
                    ]
                ]
            ])


ch1keenCertificateKor : Context -> Html Msg
ch1keenCertificateKor context =
    section "Certifications" context
        (ul []
            [ li [] [ text "아마추어무선기사 제4급" ]
              -- Information of SQL Developer
              -- vhttps://www.dataq.or.kr/www/sub/a_04.do
            , li [] [ text "SQL Developer (SQLD)" ]
              -- Information of 정보처리기사 (Engineer Information Processing)
              -- https://www.q-net.or.kr/crf005.do?id=crf00503&jmCd=1320&gbnn=gbnSubtab2
            , li [] [ text "정보처리기사" ]
            ])


ch1keenVolunteerKor : Context -> Html Msg
ch1keenVolunteerKor context =
    section "Volunteer Experience" context
        (ul []
            [ li []
                [ text "여름방학 대학생 교육기부 쏙쏙캠프: "
                , strong [] [ text "교육부장관상" ]
                , ul []
                    [ li [] [ text "쏙쏙캠프는 대학 동아리가 초등학교나 중학교에 방문하여 학생들을 가르치는 교육부 주관 교육기부 프로그램. 2018년 여름에 대전의 한 초등학교에서 교육기부를 수행하였음." ]
                    , li [] [ text "우리 동아리는 기초적인 컴퓨터과학 내용과 보안에 관해 학생들에게 가르쳐주었음. 본인은 동아리 부회장으로써 동아리원을 지휘하고, 캠프 기간동안 사용한 비용을 증빙하는 역할을 수행하였음." ]
                    , li [] [ text "우리 동아리는 학생들로부터 좋은 평가를 얻었고, 이듬해 2019년 1월 "
                            , strong [] [ text "최우수상(교육부장관상)" ]
                            , text "을 수상함."
                            ]
                    ]
                ]
            , li []
                [ text "오픈 소스 프로젝트 기여"
                , ul []
                    [ li []
                        [ text "Nix & Ronin: 루비 프로그래밍 언어로 작성된 보안 침투 도구 "
                        , a [ href "https://ronin-rb.dev/" ] [ text "'Ronin'" ]
                        , text "을 Nix 패키지 매니저에서 사용할 수 있도록 "
                        , a [ href "https://github.com/NixOS/nixpkgs/tree/master/pkgs/tools/security/ronin" ] [ text "패키징함." ]
                    ]
                    , li []
                        [ text "r2angr: "
                        , a [ href "https://t.me/radare/248089" ] [ text "angr을 이용하여 함수를 디컴파일하는 방법에 대해 Proof-of-Concept 제공." ]
                        ]
                    ]
                ]
            , li []
                [ text "KITRI BoB 9대 총동문회"
                , ul []
                    [ li [] [ text "총동문회 멤버로서 교육생들과 수료생들을 위한 워크샵과 이벤트를 기획함." ]
                    , li [] [ text "KITRI BoB 교육 프로그램에 관심이 있는 학생들을 대상으로 5개 대학교에서 홍보 활동을 펼침." ]
                    ]
                ]
            , li []
                [ text "State Of Origin CTF 2023"
                , ul []
                    [ li [] [ text "호주 퀸즐랜드 대학교(UQ) 보안동아리와의 협력으로 CTF 대회에 문제를 제공하였음." ]
                    , li [] [ text "대회 준비 및 진행동안 제공한 문제에 대한 질의응답을 받는 등 운영에 관여하였음." ]
                    ]
                ]
            , li []
                [ a [ href "https://2022.ubucon.asia/ko/" ] [ text "우부콘 아시아 2022" ]
                , ul []
                    [ li [] [ text "안내 데스크에서 국내외 참여자와 발표자를 안내하고 행사를 보조함." ] ]
                ]
            ])


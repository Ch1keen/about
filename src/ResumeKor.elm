module ResumeKor exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (class, style, href, src, width, height)
import Html.Events exposing (onClick)

import ResumeModel exposing (..)

-- MODEL

type alias CssStyling =
    Bool


init : CssStyling
init =
    True

-- UPDATE

--type Msg
--    = TogglePageStyle

update : Msg -> CssStyling -> CssStyling
update msg model = xor True model

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


section : String -> CssStyling -> Html Msg -> Html Msg
section title cssStyling body =
    if cssStyling
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


ch1keenProfileKor : CssStyling -> Html Msg
ch1keenProfileKor cssStyling =
    section "Profile" cssStyling
        (div []
            [ p []
                [ text "Highly motivated and team-friendly individual with diverse experiences not only in Automotive penetration testing, but also in web hacking, and collaborative projects. Proficient in various programming languages, frameworks, and tools. Experienced in leading teams and contributing to open-source projects." ]
            , p [] [ strong [] [ text "Keyword: " ]
                , text "Automotive, Penetration Testing, UDS(ISO 14229-1), Cyber Security, UN R.155"
            ]
        ])


ch1keenCareerKor : CssStyling -> Html Msg
ch1keenCareerKor cssStyling =
    section "Career" cssStyling
        (ul []
            [ li []
                [ text "2023.10 - present: 제어기 모의 해킹, "
                , a [ href "https://autocrypt.io" ] [ text "(주) 아우토크립트" ]
                , text " 레드팀"
                , ul []
                    [ li [] [ text "Performed penetration testing on various ECUs including infortainments, an instrumental cluster, and a telematic ECU, based on the TARA method (ISO/SAE 21434) and discovered possible vulnerabilities on Yocto Linux, QNX, and AUTOSAR based systems." ]
                    , li [] [ text "I reported 11 issues in 5 ECUs. 5 issues were classified as incidents, and reported to CEO of Hyundai Mobis (Problems from Past Projects). It was a collaboration project with Hyundai Mobis." ]
                    , li [] [ text "클러스터 제어기 기판 위에 노출된 SOIC-8 칩 SPI 라인에 장치를 연결하여 펌웨어 덤프를 시도하는 테스트를 수행." ]
                    , li [] [ text "Led V2X (Vehicle-to-Everything) testing, focusing on CAM/DENM and BSM functionalities. Specialized in reverse engineering V2X communication services and developing test plans." ]
                    , li [] [ text "Contributed to Vehicle Type Approval efforts of an In-Vehicle Infotainment (IVI) hardware by ensuring there were no vulnerabilities on CAN/UDS (ISO/SAE 14229-1) and a media player on IVI." ]
                    ]
                ]
            , li []
                [ text "2020.10 - 2021.02: 어플리케이션 개발 인턴, Petner. Co"
                , ul []
                    [ li [] [ text "댓글, 좋아요 기능이 있는 커뮤니티 서비스 론칭. 기술 스택: Ruby on Rails, Flutter" ]
                    ]
                ]
            , li []
                [ text "2019.03 - 2020.10: 대한민국 육군 정보보호병"
                , ul []
                    [ li [] [ text "분대장으로써 팀원들의 화합을 도모하고 주어진 임무를 수행함." ]
                    , li [] [ text "예하 사단에서 발생한 보안 사고를 탐지 및 제보." ]
                    ]
                ]
            , li []
                [ text "2021.01 - 2022.06: 경기대학교 차세대 보안공학 연구실(NSE Lab) 학부연구생"
                , ul []
                    [ li [] [ text "Researched blockchain technologies and security vulnerabilities." ]
                    , li [] [ text "Studied security flaws in Ethereum dApps and coin economics." ]
                    ]
                ]
            , li []
                [ text "Key Projects"
                , ul []
                    [ li []
                      [ a [ href "https://github.com/dia-language" ] [ text "Dia programming language" ]
                      , text " (2024): 강 타입(Strong Typed) 함수형 프로그래밍 언어 컴파일러(Dia -> C++) 프로젝트." ]
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
                    , li [] [ text "DevSecOps Container Security Platform (2022): A container managing platform integrating image signing and vulnerability scanning in CI/CD pipelines. Most of code was written in Python, and is open source." ]
                    , li [] [ text "NFT Trading Platform (2021): Led a team of 11 students to suggest a secure NFT trading platform to a start up." ]
                    ]
                ]
            ])


ch1keenAwardKor : CssStyling -> Html Msg
ch1keenAwardKor cssStyling =
    section "Awards and Recognitions" cssStyling
        (ul []
            [ li [] [ text "2025 전라남도 웹보안 경진대회 - 우수상" ]
            , li [] [ text "Def Con Car Hacking Village (2024) - 종합 4위"
                    , ul []
                        [ li [] [ text "AutoCrypt 레드팀 팀원들과 출전하였고, RAMN 도구를 이용한 문제에 집중." ]
                        , li [] [ text "리버스 엔지니어링을 통해 문제 해결의 실마리를 제공하였고, 문제 해결에 필요한 적절한 도구를 찾아내었음." ]
                        , li [] [ text "토요타 US 출신 출제진들을 비롯하여 타 문제 스태프들과도 소통하여 여러 힌트를 이끌어내어 팀에 기여함." ]
                        ]
                    ]
            , li [] [ text "2023 Brainhack CDDC 2023 CTF (싱가포르) - 본선 20위" ]
            , li [] [ text "2023 핵테온 세종 - 본선 21위" ]
            , li [] [ text "2021 KOSPO 웹보안 경진대회 - 장려상" ]
            , li [] [ text "2020 TS 보안 경진대회 '보안 허점을 찾아라' - 우수상" ]
            , li [] [ text "헌혈유공패 은장" ]
            ])


ch1keenEducationKor : CssStyling -> Html Msg
ch1keenEducationKor cssStyling =
    section "Education & Training" cssStyling
        (ul []
            [ li [] [ text "2023.02: Global Cyber Security 2023 교육 프로그램의 일환으로 싱가포르에서 연수함." ]
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


ch1keenCertificateKor : CssStyling -> Html Msg
ch1keenCertificateKor cssStyling =
    section "Certifications" cssStyling
        (ul []
            [ li [] [ text "아마추어무선기사 제4급" ]
              -- Information of SQL Developer
              -- vhttps://www.dataq.or.kr/www/sub/a_04.do
            , li [] [ text "SQL Developer (SQLD)" ]
              -- Information of 정보처리기사 (Engineer Information Processing)
              -- https://www.q-net.or.kr/crf005.do?id=crf00503&jmCd=1320&gbnn=gbnSubtab2
            , li [] [ text "정보처리기사" ]
            ])


ch1keenFindings : CssStyling -> Html Msg
ch1keenFindings cssStyling =
    section "Vulnerability Findings" cssStyling
        (ul []
            [ li [] [ text "GHSA-wfq4-6v32-jrhq: Open Redirect in Adoptium.net" ]
            , li [] [ text "Note: Two more vulnerability have been reported to MITRE." ]
            ])


ch1keenVolunteerKor : CssStyling -> Html Msg
ch1keenVolunteerKor cssStyling =
    section "Volunteer Experience" cssStyling
        (ul []
            [ li []
                [ text "Soksok Camp(쏙쏙캠프) by Ministry of Education (Korea)"
                , ul []
                    [ li [] [ text "Each university club goes to a middle school or a high school and teaches to the student. My club went to a middle school in the Daejeon city in the summer of 2018. It was an education charity project by the Ministry of Education of Korea." ]
                    , li [] [ text "My club taught basic computer science and security to the students. One of my role was addressing the money spent by the club during the camp." ]
                    , li [] [ text "My club got a great reputation from the students, so my club awarded "
                            , strong [] [ text "a top prize (Minister of Education's)" ]
                            , text " in 2019."
                            ]
                    ]
                ]
            , li []
                [ text "Open Source Contributions"
                , ul []
                    [ li [] [ text "Nix and Ronin: Packaged the Ruby based project 'Ronin' into the Nixpkgs." ]
                    , li [] [ text "r2angr: Provided Proof-of-Concept code on how to decompile with angr." ]
                    ]
                ]
            , li []
                [ text "BoB Alumni Council"
                , ul []
                    [ li [] [ text "Active member of the council, contributing to organizing workshops and alumni events." ]
                    , li [] [ text "Promoted cybersecurity education and awareness among university students." ]
                    ]
                ]
            , li []
                [ text "State Of Origin CTF 2023"
                , ul []
                    [ li [] [ text "Volunteered as a challenge creator and organizer for a CTF competition, providing participants with unique and engaging challenges." ]
                    , li [] [ text "Supported the event with technical and logistical assistance, ensuring a smooth experience for all participants." ]
                    ]
                ]
            , li []
                [ text "Ubuntu Asia 2022"
                , ul []
                    [ li [] [ text "Volunteered as a front desk staff at the event, helping to register and assist attendees, including international guests." ]
                    , li [] [ text "Provided logistical support and ensured smooth operation of event activities." ]
                    ]
                ]
            ])


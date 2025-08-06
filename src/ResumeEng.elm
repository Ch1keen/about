module ResumeEng exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

import ResumeModel exposing (..)


-- STYLE

footerStyle : List (Html.Attribute Msg)
footerStyle =
    [ style "color" slate_300
    , style "text-align" "center"
    ]


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


ch1keenTitle : Context -> Html Msg
ch1keenTitle context =
    let
        titleStyling =
            if context.isInteractable
            then [ style "padding-top" "48px", style "padding-bottom" "24px" ]
            else [ ]
    in
        div
            titleStyling
            [ h1 [ style "text-align" "center" ] [ text "Han Jeongjun" ]
            , contactLine (text "\u{1f4e7}") "mailto:hire-me@ch1keen.xyz" "hire-me@ch1keen.xyz"
            , contactLine (img [ src "assets/github-mark.svg", width 24, height 24 ] []) "https://github.com/Ch1keen" "github.com/Ch1keen"
            , contactLine (text "\u{1f4dd}") "https://about.ch1keen.xyz/" "about.ch1keen.xyz"
            ]


ch1keenProfile : Context -> Html Msg
ch1keenProfile context =
    section "Profile" context
        (div []
            [ p []
                [ text "Highly motivated and team-friendly individual with diverse experiences not only in Automotive penetration testing, but also in web hacking, and collaborative projects. Proficient in various programming languages, frameworks, and tools. Experienced in leading teams and contributing to open-source projects." ]
            , p [] [ strong [] [ text "Keyword: " ]
                , text "Automotive, Penetration Testing, Reverse Engineering, UDS(ISO 14229-1), Cyber Security, UN R.155"
            ]
        ])


ch1keenCareer : Context -> Html Msg
ch1keenCareer context =
    section "Career" context
        (ul []
            [ li []
                [ text "2023.10 - present: Automotive Penetration/Security Tester, "
                , a [ href "https://autocrypt.io" ] [ text "AutoCrypt" ]
                , text " Red Team"
                , ul []
                    [ li [] [ text "Performed penetration testing on various ECUs including infortainments, an instrumental cluster, and a telematic ECU, based on the TARA method (ISO/SAE 21434) and discovered possible vulnerabilities on Yocto Linux, QNX, and AUTOSAR based systems." ]
                    , li [] [ text "I reported 11 issues in 5 ECUs. 5 issues were classified as incidents, and reported to CEO of Hyundai Mobis (Problems from Past Projects). It was a collaboration project with Hyundai Mobis." ]
                    , li [] [ text "Led SPI tesing, focusing on sniffing data by connecting exposed SPI lines and dumping data of an exposed SOIC-8 chip on an instrument cluster." ]
                    , li [] [ text "Led V2X (Vehicle-to-Everything) testing, focusing on CAM/DENM and BSM functionalities. Specialized in reverse engineering V2X communication services and developing test plans." ]
                    , li [] [ text "Contributed to Vehicle Type Approval efforts of an In-Vehicle Infotainment (IVI) hardware by ensuring there were no vulnerabilities on CAN/UDS (ISO/SAE 14229-1) and a media player on IVI." ]
                    ]
                ]
            , li []
                [ text "2020.10 - 2021.02: Application Developer Intern, PETNER Co.,Ltd."
                , ul []
                    [ li [] [ text "Developed community service using Flutter and Ruby on Rails frameworks." ]
                    ]
                ]
            , li []
                [ text "2019.03 - 2020.10: "
                  -- Archive: https://web.archive.org/web/20250428083546/https://mma.go.kr/contents.do?mc=mma0000516
                , a [ href "https://www.mma.go.kr/contents.do?mc=mma0000516" ] [ text "CERT Team, Republic of Korea Army" ]
                , ul []
                    [ li [] [ text "Led a CERT squad, managing team members and executing missions." ]
                    , li [] [ text "Handled cyber security incidents across multiple divisions." ]
                    ]
                ]
            , li []
                [ text "2021.01 - 2022.06: Undergraduate Researcher, Kyonggi University NSE Lab"
                , ul []
                    [ li [] [ text "Researched blockchain technologies and security vulnerabilities." ]
                    , li [] [ text "Studied security flaws in Ethereum dApps and coin economics." ]
                    ]
                ]
            , li []
                [ text "Key Projects"
                , ul []
                    [ li []
                      [ text "The "
                      , a [ href "https://github.com/dia-language" ] [ text "Dia programming language" ]
                      , text " (2024): A functional programming language focused on portability and simplicity. Additionally, "
                      , a [ href "https://github.com/dia-language/yocto-dia-layer" ] [ text "a yocto recipe for Dia" ]
                      , text " is available."
                      ]
                    , li []
                      [ text "The "
                      , a [ href "https://wiki.ch1keen.xyz/" ] [ text "Ch1keen Wiki" ]
                      , text " (2023): Maintaining a web site about cyber security and collected notable tips, written in Next.js." ]
                    , li []
                      -- The Hacking Championship Jr. 2023 (DSEC2023 in Daegu)
                      -- 제9회 정보보안 경진대회 (Ministry of Education)
                      [ text "4 CTF Challenges in two CTFs (2023): Made 2 Cryptography, 1 Pwn, 1 Web challenges. This project was a collaboration with "
                      , a [ href "https://www.stealien.com/en/main" ] [ text "STEALIEN" ]
                      , text "."
                      ]
                    , li []
                      -- BISC CTF 2023
                      [ a [ href "https://dreamhack.io/wargame/challenges/1003" ] [ text "A Pwnable CTF Challenge" ]
                      , text " (2023): Inspired by "
                      , a [ href "https://nvd.nist.gov/vuln/detail/CVE-2018-14665" ] [ text "CVE-2018-14665" ]
                      , text "."
                      ]
                    , li [] [ text "DevSecOps Container Security Platform (2022): A container managing platform integrating image signing and vulnerability scanning in CI/CD pipelines. Most of code was written in Python, and is open source." ]
                    ]
                ]
            ])


ch1keenAward : Context -> Html Msg
ch1keenAward context =
    section "Awards and Recognitions" context
        (ul []
            [ li [] [ text "2025 South Jeolla Province Web Security Competition - Excellence Award" ]
            , li [] [ text "4th Place, Def Con Car Hacking Village (2024)"
                    , ul []
                        [ li [] [ text "Collaborated with the AutoCrypt Red Team, focusing on RAMN challenges." ]
                        , li [] [ text "Provided reverse engineering insights and identified necessary tools for challenge solutions." ]
                        , li [] [ text "Facilitated team communication with event staff to obtain critical hints and guidance." ]
                        ]
                    ]
            , li [] [ text "2023 Brainhack CDDC 2023 CTF (Singapore) - Final 20th Place" ]
              -- Hacktheon Sejong 2023: https://web.archive.org/web/20250720105349/https://overseas.mofa.go.kr/be-en/brd/m_7437/view.do?seq=761051
              -- https://web.archive.org/web/20250211182326/https://hacktheon.org/2023/eng/overview.php
            , li []
                [ a [ href "https://hacktheon.org/2023/eng/overview.php" ] [ text "2023 Hacktheon Sejong International Univ. Students' Cyber Security Competition (Korea) " ]
                , strong [] [ text "- Final 21th Place" ]
                ]
            , li [] [ text "2021 KOSPO Web Security Competition - Encouragement Award" ]
            , li [] [ text "2020 TS Security Competition 'Find Security holes' - Excellence Award" ]
            , li [] [ text "Blood Donation Merit Award (Silver)" ]
            ])


ch1keenEducation : Context -> Html Msg
ch1keenEducation context =
    section "Education & Training" context
        (ul []
            [ li [] [ a [ href "https://gcc.ac/archive/gcc_2023/" ] [ text "2023.02: Global Cyber Security 2023 in Singapore" ] ]
            , li []
                [ text "2022.06 - 2023.03: "
                , a [ href "https://en.kitribob.kr/" ] [ text "KITRI Best of the Best" ]
                , text "11th - Vulnerability Analysis Track"
                ]
            , li []
                [ text "2017.03 - 2023.02: Kyonggi University"
                , ul []
                    [ li [] [ text "Bachelor of Convergence Security" ]
                    , li [] [ text "Bachelor of Electronics Engineering" ]
                    , li [] [ text "(GPA: 3.91/4.5; Double Majors)" ]
                    ]
                ]
            ])


ch1keenCertificate : Context -> Html Msg
ch1keenCertificate context =
    section "Certifications" context
        (ul []
            [ li [] [ text "Forth Class Amateur Radio Operator (Korea)" ]
              -- Information of SQL Developer
              -- vhttps://www.dataq.or.kr/www/sub/a_04.do
            , li [] [ text "SQL Developer (SQLD)" ]
              -- Information of 정보처리기사 (Engineer Information Processing)
              -- https://www.q-net.or.kr/crf005.do?id=crf00503&jmCd=1320&gbnn=gbnSubtab2
            , li [] [ text "Engineer Information Processing (정보처리기사)" ]
            ])


ch1keenFindings : Context -> Html Msg
ch1keenFindings context =
    section "Vulnerability Findings" context
        (ul []
            [ li []
                [ a [ href "https://github.com/Ch1keen/Adoptium.net-next-security-advisory" ]
                    [ text "GHSA-wfq4-6v32-jrhq: Open Redirect in Adoptium.net" ] ]
            , li []
                [ a [ href "https://github.com/Ch1keen/smallbasic-vulnerability-1" ]
                    [ text "Global Buffer Overflow in SmallBASIC (sbasg)" ] ]
            , li [] [ text "Note: A vulnerability was reported to MITRE." ]
            ])


ch1keenVolunteer : Context -> Html Msg
ch1keenVolunteer context =
    section "Volunteer Experience" context
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
                [ text "KITRI BoB Alumni Council"
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
                [ text "UbuCon Asia 2022"
                , ul []
                    [ li [] [ text "Volunteered as a front desk staff at the event, helping to register and assist attendees, including international guests." ]
                    , li [] [ text "Provided logistical support and ensured smooth operation of event activities." ]
                    ]
                ]
            ])


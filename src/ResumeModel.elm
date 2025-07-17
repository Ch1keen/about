module ResumeModel exposing (..)

type alias Context =
    { isInteractable : Bool
    , engVisible : Bool
    , korVisible : Bool
    , ctrlerOpacity : String
    }


pageStyleToggle : Bool -> Msg
pageStyleToggle event =
    if event == True
    then PageStyleToInteractable
    else PageStyleToPrintable

toggleKorPage : Bool -> Msg
toggleKorPage event =
    if event == True
    then KoreaResumeVisible
    else KoreaResumeInvisible

toggleEngPage : Bool -> Msg
toggleEngPage event =
    if event == True
    then EnglishResumeVisible
    else EnglishResumeInvisible

type Msg
    = PageStyleToPrintable
    | PageStyleToInteractable
      -- Language Selection
    | KoreaResumeVisible
    | KoreaResumeInvisible
    | EnglishResumeVisible
    | EnglishResumeInvisible
      -- Mouse Over Event
    | FocusController
    | ZoneOutController

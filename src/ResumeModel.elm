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
toggleKorPage event = KoreaResumeVisible

toggleEngPage : Bool -> Msg
toggleEngPage event = EnglishResumeVisible

toggleBothEngKorPage : Bool -> Msg
toggleBothEngKorPage event = EnglishKoreaResumeVisible

type Msg
    = PageStyleToPrintable
    | PageStyleToInteractable
      -- Language Selection
    | KoreaResumeVisible
    | EnglishResumeVisible
    | EnglishKoreaResumeVisible
      -- Mouse Over Event
    | FocusController
    | ZoneOutController

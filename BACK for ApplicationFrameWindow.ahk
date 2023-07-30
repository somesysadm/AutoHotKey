#IfWinActive ahk_class ApplicationFrameWindow
!left::   ; BACK button in Windows Settings !!!  WORKS !!!
          CoordMode mouse, Relative
          mousegetpos x_sav, y_sav
          tooltip_("clicking BACK in ApplicationFrameWindow", 1000)

          WinGetPos, x, y
          mousemove % x+120, y+2
          sleep 50
          MouseGetPos, , , hwnd, ctrlll      ;log_("--1: hwnd:"  hwnd  " ctrl:" ctrlll "`n", "")

          switch ctrlll {
             case "Windows.UI.Core.CoreWindow1":       ; windows.immersivecontrolpanel_cw5n1h2txyewy!microsoft.windows.immersivecontrolpanel
                        ControlGetPos, x, y, w, h, ApplicationFrameTitleBarWindow1, ahk_id %hwnd%         ;log_(" --2: ctrl type CoreWindow1: "  x  "x"  y  "  WxH:"  w "x" h  " errorlevel=" errorlevel  "`n", "")
                        sleep 50
                        ControlClick, x%x% y%y%, ahk_id %hwnd%                                             ;log_(" --3: ctrl type CoreWindow1: "  x  "x"  y  "  w x h: "  w "x" h  " errorlevel=" errorlevel  "`n", "")
             case "ApplicationFrameTitleBarWindow1":   ; Microsoft.Windows.SecHealthUI_cw5n1h2txyewy!SecHealthUI
                        ControlGetPos, x, y, w, h, ApplicationFrameInputSinkWindow1, ahk_id %hwnd%         ;log_(" --2: ctrl type SinkWindow1: "  x  "x"  y  "  WxH:"  w "x" h  " errorlevel=" errorlevel  "`n", "")
                        sleep 50
                        x += 10,  y += 10
                        mousemove % x, y
                        sleep 50
                        mouseclick % left, x, y                                                           ;log_(" --3: ctrl type SinkWindow1: "  x  "x"  y  "  w x h: "  w "x" h  " errorlevel=" errorlevel  "`n", "")
          }
      mousemove x_sav, y_sav
      return
#If

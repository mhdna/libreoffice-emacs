Sub MoveToNextWord
    Dim oVC As Object
    Dim oTC As Object
    Dim oVCursor As Object

    oVC = ThisComponent.CurrentController.ViewCursor
    oTC = ThisComponent.Text.createTextCursorByRange(oVC)
    oTC.gotoNextWord(False, True)
    oVC.gotoRange(oTC, False)
End Sub

Sub DeleteCharacter
    Dim oVC As Object
    oVC = ThisComponent.CurrentController.getViewCursor()
    oVC.goRight(1, True)
    oVC.String = ""
End Sub

Sub HighlightTextWithCurrentColor
    Dim oDoc As Object
    Dim oText As Object
    Dim oCursor As Object
    Dim oViewCursor As Object
    Dim oHighlight As Object
    
    ' Get the current document
    oDoc = ThisComponent
    
    ' Get the text cursor
    oText = oDoc.Text
    
    ' Get the view cursor
    oViewCursor = oDoc.CurrentController.getViewCursor()
    
    ' Get the highlight object
    oHighlight = oViewCursor.CharBackColor
    
    ' If the highlight color is not black (default), set the text background color to the highlight color
    If Not oHighlight.EqualsRGB(0, 0, 0) Then
        oText.CharBackColor = oHighlight
    End If
End Sub


sub highlightWord
rem ----------------------------------------------------------------------
rem define variables
dim document   as object
dim dispatcher as object
rem ----------------------------------------------------------------------
rem get access to the document
document   = ThisComponent.CurrentController.Frame
dispatcher = createUnoService("com.sun.star.frame.DispatchHelper")

rem ----------------------------------------------------------------------
dim args1(0) as new com.sun.star.beans.PropertyValue
args1(0).Name = "BackColor"
args1(0).Value = 16776960

dispatcher.executeDispatch(document, ".uno:BackColor", "", 0, args1())


end sub


sub highlightSelection
rem ----------------------------------------------------------------------
rem define variables
dim document   as object
dim dispatcher as object
rem ----------------------------------------------------------------------
rem get access to the document
document   = ThisComponent.CurrentController.Frame
dispatcher = createUnoService("com.sun.star.frame.DispatchHelper")

rem ----------------------------------------------------------------------
dim args1(0) as new com.sun.star.beans.PropertyValue
args1(0).Name = "BackColor"
args1(0).Value = 16776960

dispatcher.executeDispatch(document, ".uno:BackColor", "", 0, args1())


end sub


sub ctrlBackspace
rem ----------------------------------------------------------------------
rem define variables
dim document   as object
dim dispatcher as object
rem ----------------------------------------------------------------------
rem get access to the document
document   = ThisComponent.CurrentController.Frame
dispatcher = createUnoService("com.sun.star.frame.DispatchHelper")

rem ----------------------------------------------------------------------
dispatcher.executeDispatch(document, ".uno:DelToStartOfWord", "", 0, Array())


end sub


sub selectNextWord
rem ----------------------------------------------------------------------
rem define variables
dim document   as object
dim dispatcher as object
rem ----------------------------------------------------------------------
rem get access to the document
document   = ThisComponent.CurrentController.Frame
dispatcher = createUnoService("com.sun.star.frame.DispatchHelper")

rem ----------------------------------------------------------------------
dispatcher.executeDispatch(document, ".uno:WordRightSel", "", 0, Array())


end sub

sub selectNextChar
    selectText(".uno:CharRightSel", 0) ' No modifier for next character
end sub

sub selectPreviousChar
    selectText(".uno:CharLeftSel", 0) ' No modifier for previous character
end sub

sub selectText(command as String, keyModifier as Integer)
    rem ----------------------------------------------------------------------
    rem define variables
    dim document   as object
    dim dispatcher as object
    dim args(0) as new com.sun.star.beans.PropertyValue
    rem ----------------------------------------------------------------------
    rem get access to the document
    document   = ThisComponent.CurrentController.Frame
    dispatcher = createUnoService("com.sun.star.frame.DispatchHelper")

    rem ----------------------------------------------------------------------
    rem Set the properties for Ctrl+Shift+Right arrow key press
    args(0).Name = "KeyModifier"
    args(0).Value = keyModifier

    rem ----------------------------------------------------------------------
    rem simulate key press to select text
    dispatcher.executeDispatch(document, command, "", 0, args())
end sub


sub hikmahFootnote
rem ----------------------------------------------------------------------
rem define variables
dim document   as object
dim dispatcher as object
rem ----------------------------------------------------------------------
rem get access to the document
document   = ThisComponent.CurrentController.Frame
dispatcher = createUnoService("com.sun.star.frame.DispatchHelper")

rem ----------------------------------------------------------------------
dim args1(0) as new com.sun.star.beans.PropertyValue
args1(0).Name = "Text"
args1(0).Value = "#"

dispatcher.executeDispatch(document, ".uno:InsertText", "", 0, args1())

rem ----------------------------------------------------------------------
dispatcher.executeDispatch(document, ".uno:InsertFootnote", "", 0, Array())

rem ----------------------------------------------------------------------
dim args3(0) as new com.sun.star.beans.PropertyValue
args3(0).Name = "Text"
args3(0).Value = " برينستون "+CHR$(34)+CHR$(34)

dispatcher.executeDispatch(document, ".uno:InsertText", "", 0, args3())

rem ----------------------------------------------------------------------
dim args4(1) as new com.sun.star.beans.PropertyValue
args4(0).Name = "Count"
args4(0).Value = 1
args4(1).Name = "Select"
args4(1).Value = false

dispatcher.executeDispatch(document, ".uno:GoLeft", "", 0, args4())


end sub

sub GoToPreviousPosition
rem ----------------------------------------------------------------------
rem define variables
dim document   as object
dim dispatcher as object
rem ----------------------------------------------------------------------
rem get access to the document
document   = ThisComponent.CurrentController.Frame
dispatcher = createUnoService("com.sun.star.frame.DispatchHelper")

rem ----------------------------------------------------------------------
dim args1(21) as new com.sun.star.beans.PropertyValue
args1(0).Name = "SearchItem.StyleFamily"
args1(0).Value = 2
args1(1).Name = "SearchItem.CellType"
args1(1).Value = 1
args1(2).Name = "SearchItem.RowDirection"
args1(2).Value = true
args1(3).Name = "SearchItem.AllTables"
args1(3).Value = false
args1(4).Name = "SearchItem.SearchFiltered"
args1(4).Value = false
args1(5).Name = "SearchItem.Backward"
args1(5).Value = true
args1(6).Name = "SearchItem.Pattern"
args1(6).Value = false
args1(7).Name = "SearchItem.Content"
args1(7).Value = false
args1(8).Name = "SearchItem.AsianOptions"
args1(8).Value = false
args1(9).Name = "SearchItem.AlgorithmType"
args1(9).Value = 0
args1(10).Name = "SearchItem.SearchFlags"
args1(10).Value = 0
args1(11).Name = "SearchItem.SearchString"
args1(11).Value = "#"
args1(12).Name = "SearchItem.ReplaceString"
args1(12).Value = ""
args1(13).Name = "SearchItem.Locale"
args1(13).Value = 255
args1(14).Name = "SearchItem.ChangedChars"
args1(14).Value = 2
args1(15).Name = "SearchItem.DeletedChars"
args1(15).Value = 2
args1(16).Name = "SearchItem.InsertedChars"
args1(16).Value = 2
args1(17).Name = "SearchItem.TransliterateFlags"
args1(17).Value = 256
args1(18).Name = "SearchItem.Command"
args1(18).Value = 0
args1(19).Name = "SearchItem.SearchFormatted"
args1(19).Value = false
args1(20).Name = "SearchItem.AlgorithmType2"
args1(20).Value = 1
args1(21).Name = "Quiet"
args1(21).Value = true

dispatcher.executeDispatch(document, ".uno:ExecuteSearch", "", 0, args1())

rem ----------------------------------------------------------------------
dispatcher.executeDispatch(document, ".uno:Delete", "", 0, Array())


end sub


sub hikmahFootnote2
rem ----------------------------------------------------------------------
rem define variables
dim document   as object
dim dispatcher as object
rem ----------------------------------------------------------------------
rem get access to the document
document   = ThisComponent.CurrentController.Frame
dispatcher = createUnoService("com.sun.star.frame.DispatchHelper")

rem ----------------------------------------------------------------------
dim args1(0) as new com.sun.star.beans.PropertyValue
args1(0).Name = "Text"
args1(0).Value = "#"

dispatcher.executeDispatch(document, ".uno:InsertText", "", 0, args1())

rem ----------------------------------------------------------------------
dispatcher.executeDispatch(document, ".uno:InsertFootnote", "", 0, Array())

rem ----------------------------------------------------------------------
dim args3(0) as new com.sun.star.beans.PropertyValue
args3(0).Name = "Text"
args3(0).Value = " برينستون "

dispatcher.executeDispatch(document, ".uno:InsertText", "", 0, args3())

rem ----------------------------------------------------------------------
dispatcher.executeDispatch(document, ".uno:SwBackspace", "", 0, Array())

rem ----------------------------------------------------------------------
dim args5(0) as new com.sun.star.beans.PropertyValue
args5(0).Name = "Text"
args5(0).Value = ": "+CHR$(34)+CHR$(34)+" بدلا عن "+CHR$(34)+CHR$(34)

dispatcher.executeDispatch(document, ".uno:InsertText", "", 0, args5())

rem ----------------------------------------------------------------------
dispatcher.executeDispatch(document, ".uno:GoToPrevWord", "", 0, Array())

rem ----------------------------------------------------------------------
dispatcher.executeDispatch(document, ".uno:GoToPrevWord", "", 0, Array())

rem ----------------------------------------------------------------------
dispatcher.executeDispatch(document, ".uno:GoToPrevWord", "", 0, Array())

rem ----------------------------------------------------------------------
dispatcher.executeDispatch(document, ".uno:GoToPrevWord", "", 0, Array())

rem ----------------------------------------------------------------------
dim args10(1) as new com.sun.star.beans.PropertyValue
args10(0).Name = "Count"
args10(0).Value = 1
args10(1).Name = "Select"
args10(1).Value = false

dispatcher.executeDispatch(document, ".uno:GoRight", "", 0, args10())


end sub

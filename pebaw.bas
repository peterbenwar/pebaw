/'
	Titel: 			pebaw
	Compiler:		FreeBasic
	Zweck:			Permutiere ersten Buchstaben aller Worte in einem 
					Sinnspruch.
	Wie?:			Du ziehst eine Text-Datei auf das pebaw-Icon und
					pebaw startet den Text-Editor mit dem Ergebnis, das
					temporär in t-40€.txt gespeichert ist, und dort
					sofort gelöscht wird, wenn du den Editor beendest.
					Was auch immer du mit dem Ergebnis machen willst,
					mache es bevor du den Editor schließt.
					Alternativ rufst du pebaw in der Konsole auf mit
					dem Parameter derjenigen Textdatei, die den Sinn-
					spruch enthält.
'/

function readFile(cmd as string) as string
	dim ret as string
	dim ch as integer = freefile	
	Open cmd For Binary Access Read As ch
	  If LOF(ch) > 0 Then    
		ret = String(LOF(1), 0)    
		Get #ch, , ret
	  End If
	Close ch 
	return ret
end function

sub writeFile(content as string,fileName as string)
	dim ch as integer = freefile
	Open fileName For Binary As ch
	Put #ch, , content	  
	Close ch	
end sub

function countWords(content as string) as integer
	dim ret as integer
	dim position as integer = 1
	dim char as integer	
	do while position <= len(content)
		char = asc(mid(content,position,1))
		select case char
		case 32
			ret += 1
		case 13
			if position+1 < len(content) then ret += 1
		case else
		end select
		position += 1
	loop	
	return ret
end function

sub split(Content as string, Words() as string)
	dim ret as integer
	dim position as integer = 1
	dim char as integer	
	do while position <= len(content)
		char = asc(mid(content,position,1))
		select case char
		case 32
			ret += 1
		case 13
			ret += 1
		case else
			if char > 32 then Words(ret) = Words(ret) & chr(char)
		end select		
		position += 1
	loop
end sub

sub swapFirstChars(Words() as string)
	dim as string swap1, swap2
	dim as integer i
	swap1 = left(words(0),1)
	for i = ubound(words) to 0 step -1
		swap2 = left(words(i),1)		
		mid(words(i),1,1) = swap1
		swap1 = swap2
	next i
end sub

sub pebaw(cmd as string, OutFile as string)
	if len(cmd)=0 then exit sub	
	dim content as string = readFile(cmd)	
	dim count as integer = countWords(content)
	Dim Words(count) as string	
	split(content, Words())	
	dim as integer i, j
	dim as string tmp
	content = ""
	for i = 0 to Count
		swapFirstChars(Words())
		tmp = ""
		for j = 0 to Count
			tmp = tmp & words(j) & " "
		next j		
		content = content & tmp		
	next i
	writeFile(Content, OutFile)
end sub

dim OutFile as string = "t-40.txt"
pebaw(Command, OutFile)
shell "notepad " & outFile

Dim result As Integer = Kill( outFile )
If result <> 0 Then Print "error trying to kill " ; outFile ; " !"

end

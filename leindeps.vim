function! GetBracketsPosAtCursor()
	return [
		\ searchpairpos('\[', '', '\]\zs', 'bcnzW'),
		\ searchpairpos('.\[', '', '\]', 'cnW')
	\]
endfunction

function! GetInsideOfBracketsAsLine(bpos)
  	let lines_list = getline(a:bpos[0][0], a:bpos[1][0])
	let lines_concat_str = join(lines_list, "\n")
	let start_pos = a:bpos[0][1]
	let end_pos = strlen(lines_concat_str) - strlen(lines_list[-1]) + a:bpos[1][1] - 2

	return lines_concat_str[start_pos:end_pos]
endfunction

function! ExtractLibraryNameFromString(str)
	if a:str =~ '\v^\w*(.+)\w*'
		echo "yes"
	else
		echo "no"
	endif
endfunction

function! ClojarsVersionInfo()
	let bpos = GetBracketsPosAtCursor()
	let content =  GetInsideOfBracketsAsLine(bpos)
	echo ExtractLibraryNameFromString(content)
endfunction


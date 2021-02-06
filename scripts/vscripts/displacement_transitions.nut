MapPlayOrder<- [
	"sp_introduction",
	"sp_continuation",
	"sp_ricochet",
	"sp_nortal",
	"sp_doubleglass",
	"sp_barier",
	"sp_displate",
	"sp_fizzlerado",
	"thanksfortesting"
]

function TransitionToNextMap() {
	foreach (index, map in MapPlayOrder) {
		if ( GetMapName() == MapPlayOrder[index] )
			ChangeLevel( MapPlayOrder[index + 1] );
	}
}


function ChangeLevel(mapname) {
	SendToConsole("map " + mapname);
}

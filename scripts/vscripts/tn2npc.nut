function startMove() {
    self.moving = true;
}

function endMove() {
    self.moving = false;
    startIdle()
}

function startIdle() {
    self.idle = true;
}

function endIdle() {
    self.idle = false;
}

function init() {
    self.moving <- false;
    self.idle <- true;
}

function think() {

}

function IgniteSelf() {
	DoEntFire( "!self", "Ignite", "", 0, self, self )
}

init()
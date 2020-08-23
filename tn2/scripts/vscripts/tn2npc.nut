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
    if (self.moving instanceof null) {
        init()
    }
}
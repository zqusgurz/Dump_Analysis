return function (self) 
self.Melee = {
    [0] = {
        [0] = {_CharacterAction.SWINGO1, _CharacterAction.SWINGO2, _CharacterAction.SWINGO3, _CharacterAction.STABO1, _CharacterAction.STABO2},
        [1] = {_CharacterAction.SWINGOF, _CharacterAction.STABOF}
    },
    [1] = {
        [0] = {_CharacterAction.SWINGT2, _CharacterAction.SWINGP1, _CharacterAction.SWINGP2, _CharacterAction.STABT1, _CharacterAction.STABT2},
        [1] = {_CharacterAction.SWINGPF, _CharacterAction.STABTF}
    },
    [2] = {
        [0] = {_CharacterAction.SWINGT1, _CharacterAction.SWINGT3},
        [1] = {_CharacterAction.SHOOTF}
    },
    [3] = {
        [0] = {_CharacterAction.SWINGT1, _CharacterAction.SWINGT3},
        [1] = {}
    },
    [4] = {
        [0] = {_CharacterAction.SWINGT1, _CharacterAction.SWINGT2, _CharacterAction.SWINGT3, _CharacterAction.STABO1, _CharacterAction.STABO2},
        [1] = {_CharacterAction.SWINGTF, _CharacterAction.STABOF}
    },
    [5] = {
        [0] = {_CharacterAction.SWINGO2},
        [1] = {}
    },
    [6] = {
        [0] = {_CharacterAction.STABO1, _CharacterAction.STABO2},
        [1] = {}
    },
    [7] = {
        [0] = {_CharacterAction.STABO1, _CharacterAction.STABO2},
        [1] = {}
    },
    [8] = {
        [0] = {_CharacterAction.SWINGT1, _CharacterAction.SWINGT2, _CharacterAction.SWINGT2},
        [1] = {}
    },
    [9] = {
        [0] = {--[[_CharacterAction.SWINGD1, _CharacterAction.SWINGD2, _CharacterAction.STABD1]]},
        [1] = {}
    }
}

self.Shoot = {
    [0] = {[0] = {}, [1] = {}},
    [1] = {[0] = {}, [1] = {}},
    [2] = {
        [0] = {_CharacterAction.SHOOT1}, 
        [1] = {_CharacterAction.SHOOTF}
    },
    [3] = {
        [0] = {_CharacterAction.SHOOT2}, 
        [1] = {_CharacterAction.SHOOT2}
    },
    [4] = {[0] = {}, [1] = {}},
    [5] = {[0] = {}, [1] = {}},
    [6] = {
        [0] = {_CharacterAction.SWINGO1_SHOOT, _CharacterAction.SWINGO2_SHOOT, _CharacterAction.SWINGO3_SHOOT}, 
        [1] = {_CharacterAction.SWINGO1_SHOOT, _CharacterAction.SWINGO2_SHOOT, _CharacterAction.SWINGO3_SHOOT}
    },
    [7] = {[0] = {}, [1] = {}},
    [8] = {
        [0] = {--[[_CharacterAction.SHOT]]}, 
        [1] = {--[[_CharacterAction.SHOT]]}
    },
    [9] = {[0] = {}, [1] = {}},
}

self.Magic = {
    [0] = {
        [0] = {_CharacterAction.SWINGO1}, 
        [1] = {_CharacterAction.SWINGO3}
    },
    [1] = {[0] = {}, [1] = {}},
    [2] = {[0] = {}, [1] = {}},
    [3] = {[0] = {}, [1] = {}},
    [4] = {[0] = {}, [1] = {}},
    [5] = {
        [0] = {_CharacterAction.SWINGO1}, 
        [1] = {_CharacterAction.SWINGO3}
    },
    [6] = {[0] = {}, [1] = {}},
    [7] = {[0] = {}, [1] = {}},
    [8] = {[0] = {}, [1] = {}},
    [9] = {[0] = {}, [1] = {}},
}
end
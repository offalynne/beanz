/// @description

playerCount     = 4;
syncTest        = true;
testPlayerCount = 1;

//Macros for autocompletion ease
#macro inputUp        "inputUp"
#macro inputLeft      "inputLeft"
#macro inputDown      "inputDown"
#macro inputRight     "inputRight"
#macro inputConfirm   "inputConfirm"
#macro inputBack      "inputBack"
#macro inputQuit      "inputQuit"
#macro inputWheelUp   "inputWheelUp"
#macro inputWheelDown "inputWheelDown"
#macro inputMouseX    "inputMouseX"
#macro inputMouseY    "inputMouseY"
#macro inputClick     "inputClick"

inputList = [inputUp, inputLeft, inputDown, inputRight, inputConfirm, inputBack, inputQuit, inputWheelUp, inputWheelDown, inputMouseX, inputMouseY, inputClick, ];

var _inputStruct = {
        inputUp:        [ord("W"),     vk_up,    gp_padu,  ],
        inputLeft:      [ord("A"),     vk_left,  gp_padl,  ],
        inputDown:      [ord("S"),     vk_down,  gp_padd,  ],
        inputRight:     [ord("D"),     vk_right, gp_padr,  ],
        inputConfirm:   [vk_space,     ord("C"), gp_face1, ],
        inputBack:      [vk_backspace, ord("X"), gp_face2, ],
        inputQuit:      [vk_escape,    vk_end,   gp_start, ],
        inputWheelUp:    m_scroll_up,
        inputWheelDown:  m_scroll_down,
        inputMouseX:     m_axisx,
        inputMouseY:     m_axisy,
        inputClick:      mb_left,
};


#region Sync Test Mock Players

if (syncTest)
{
    _i = 1;
    repeat(playerCount)
    {
        var _inputTestStruct = {};
        
        var _ii = 0;
        repeat(array_length(inputList))
        {
            //Initialise to none
            _inputTestStruct[$ inputList[_ii]] = 0;
            ++_ii;
        }

        if (_i <= testPlayerCount)
        {
            //Set test keys
            _inputTestStruct[$ inputUp]      = ord("I");
            _inputTestStruct[$ inputLeft]    = ord("J");
            _inputTestStruct[$ inputDown]    = ord("K");
            _inputTestStruct[$ inputRight]   = ord("L");
            _inputTestStruct[$ inputConfirm] = ord("M");
            _inputTestStruct[$ inputBack]    = ord(",");
            _inputTestStruct[$ inputQuit]    = ord(".");
        }
        
        rollback_define_mock_input(_i, _inputTestStruct);
        ++_i;
    }
}

#endregion

rollback_define_player(ObjectUnitPlayer);
rollback_define_input(_inputStruct);

var _joined = rollback_join_game();
if not (_joined) rollback_create_game(playerCount, syncTest);
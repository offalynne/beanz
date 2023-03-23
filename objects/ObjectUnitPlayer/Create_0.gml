/// @description 

if (!is_numeric(player_id) || (player_id < 0) || (player_id >= ObjectRollbackManager.playerCount))
{
    show_error("player_id out of bounds: " + string(player_id), true);
    return;
}

sprite_index = SpriteFireguy;
y = room_height/2;
x = (player_id*200) + 200;

moveSpeed = 3;

tick = function()
{
    var _input = rollback_get_input();
    var _inputX = _input[$ inputRight] - _input[$ inputLeft];
    var _inputY = _input[$ inputDown]  - _input[$ inputUp];
    
    var _collisions = move_and_collide(
                        lengthdir_x(point_distance(0, 0, _inputX, _inputY)*moveSpeed, point_direction(0, 0, _inputX, _inputY)),
                        lengthdir_y(point_distance(0, 0, _inputX, _inputY)*moveSpeed, point_direction(0, 0, _inputX, _inputY)),
                        all, 1
                      );
}
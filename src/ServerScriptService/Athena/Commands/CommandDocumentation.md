# Command Documentation

This is a documentation of how to make a command in Athena and the proper rules to adhere to.

## Command Structure

Notes: This will use indentation to make it clear what level they are on.

CommandFile - Ex: baseCommands.lua
    commandType - Put the type of command here, good practice to have it be the same as the file name.
        commandName - The name of the command, this is what the user will type to run the command!
            CmdName - The name of the command. : String
            Level - The level of the command. : Number or Variable for the number (in-dev)
            CmdDesc - The description of the command. : String
            Function - The function that will be ran when the command is ran. : Function

## Example Function

Each command will have a function that will be ran when the command is ran. The command will be passed the player and the arguments that the player typed in. The args will be an array and all of the handling for the args should be done in the function.

Every function should return a boolean, true if the command was successful and false if it was not. If you want to return a specific message you can return a string instead of a boolean.

```lua
Function = function(plr, args)
    print("Hello World!")
    return true
end
```

## Example Command

```lua
local baseCommands = { -- The object of all the commands, this wil not be used for every command.
    CmdName = "hello", -- The name of the command
    Level = 1, -- Level of the command (in-dev)
    CmdDesc = "Prints Hello to the argument", -- Description of the command
    Function = function(plr, args) -- The function that will be ran when the command is ran
        if #args < 1 then
            return "You need to provide an argument!" -- If there are no args provided it returns an error message!
        end
        local thing = args[1] -- Gets the first argument and sets it to a variable (easier to read)
        print("Hello " .. arg .. "!") -- Prints Hello to the argument
        return true -- Returns true because the command was successful
    end
}
```

This is the basic structure of a command. You can add more commands to the same file or make a new file for a new command type.
Last updated: 12/31/22 7:00 AM
Author: Cater

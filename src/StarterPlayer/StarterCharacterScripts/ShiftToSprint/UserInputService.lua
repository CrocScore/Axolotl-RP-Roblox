--[[
	~ ScriptGuider
	
	A better UserInputService module to make interacting with your game easier. 
	This module allows you to connect functions to certain events without the need
	to actually call the UserInputService, or compare any Enum codes to input
	objects. This is both faster to reference, and considerably more readable
	to the writer.
	
	---------
	Functions
	---------
	
	* Module::CreateEvent()
		
		- Parameters:  None
		- Returns:     Table
		- Description: Creates a BindableEvent that imitates ROBLOX's standard
		object events, giving you the ability to connect, disconnect, wait, 
		and fire the custom event whenever you want.
		
	* Module::GetService()
		
		- Parameters:  None
		- Returns:     UserInputService
		- Description: Returns the real UserInputService called from within
		the module.
		
	* Module::GetMouse()
		
		- Parameters:  None
		- Returns:     Player's mouse
		- Description: Returns the real PlayerMouse object
		
	----------
	Key events
	----------
	
	Key events are stored inside a table called "Keys", which you can access directly
	from the module. Here's an example:
	
	~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	local keyInput = module.Keys
	~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	
	Once you've accessed this table, you can index it for any input type that exists
	in the KeyCode enum element. For example, if you wanted to create an event for 
	the key "Q", you'd simply write that:
	
	~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	local keyInput = module.Keys
	
	local Q_Event = keyInput.Q.KeyDown:connect(function()
		print("Q was pressed")
	end
	~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	
	Each key has a "KeyUp" and "KeyDown" event that comes with it. So you can't just
	connect the key to an event, you must specify if the event will fire on KeyUp
	or on KeyDown. These KeyUp and KeyDown events aren't done with the player mouse,
	so you don't have to worry about this module using deprecated methods.
	
	------------
	Mouse events
	------------
	
	Mouse events remain the same as just creating them normally on the real
	PlayerMouse object. For example, creating a Button1Down event would be
	done like so:
	
	~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	local mouseEvent = module.Mouse
	
	local button1down = mouseEvent.Button1Down:connect(function()
		print("Button was clicked")
	end)
	
	-- And of course you could fire it manually, since it returns a custom event
	
	button1down:Fire()
	~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	
--]]

-- Services
local InputService = game:GetService("UserInputService")
local Players = game:GetService("Players")

-- Client
local Player = Players.LocalPlayer
local Mouse = Player:GetMouse()

-- Library & Input
local Input = {}
Input.Keys  = {}
Input.Mouse = {}
Input.Scope = {}

local KeyEvents   = {}
local MouseEvents = {}

-- Utility functions
local function CreateEvent()
	local this = {}
	local connections = {}
	local event = Instance.new("BindableEvent")
	
	function this:connect(func)
		local scope = {}
		local signal = event.Event:connect(function(callback)
			callback(scope, func)
		end)
		connections[signal] = true
		local new = {}
		function new:disconnect()
			scope = nil
			connections[signal] = nil
			signal:disconnect()
		end
		return new
	end
	
	function this:disconnect()
		for i,v in next, connections do
			i:disconnect()
			connections[i] = nil
		end
	end
	
	function this:wait()
		return event.Event:wait()
	end
	
	-- Bypasses object cloning
	function this:Fire(...)
		local args = {...}
		event:Fire(function(scope, main)
			main(scope, unpack(args))
		end)
	end
	
	return this
end

-- Create key input events
local function CreateKeyEvent()
	return {
		KeyUp   = CreateEvent(),
		KeyDown = CreateEvent()
	}
end

local function ValidKeyEvent(v)
	local KeyCode = Enum.KeyCode[v]
	local KeyValue = KeyCode.Value
	local Key = KeyEvents[KeyValue]
	if not Key then
		KeyEvents[KeyValue] = CreateKeyEvent()
		Key = KeyEvents[KeyValue]
	end
	return Key
end

local function ValidMouseEvent(v)
	local IsEvent = pcall(function()
		local _ = Mouse[v].connect
	end)
	if IsEvent then
		local Stored = MouseEvents[v]
		if not Stored then
			MouseEvents[v] = CreateEvent()
			Stored = MouseEvents[v]
			Mouse[v]:connect(function(...)
				Stored:Fire(Input.Scope, ...)
			end)
		end
		return Stored
	end
end

-- Convert text to KeyCode values
setmetatable(Input.Keys, {
	__index = function(t,k)
		if type(k) == "string" then
			return ValidKeyEvent(k)
		end
	end,
})

setmetatable(Input.Mouse, {
	__index = function(t,k)
		if type(k) == "string" then
			return ValidMouseEvent(k)
		end
	end
})

-----------------------
-- Library interface --
-----------------------

-- Create a new event signal
function Input:CreateEvent()
	return CreateEvent()
end

-- Return the UIS
function Input:GetService()
	return InputService
end

-- Return the player mouse
function Input:GetMouse()
	return Mouse
end

-- Input began listener
InputService.InputBegan:connect(function(InputObject)
	local KeyCode   = InputObject.KeyCode
	local KeyInput  = KeyEvents[KeyCode.Value]
	
	if KeyInput then
		KeyInput.KeyDown:Fire(Input.Scope)
	end
end)

-- Input ended listener
InputService.InputEnded:connect(function(InputObject)
	local KeyCode   = InputObject.KeyCode
	local KeyInput  = KeyEvents[KeyCode.Value]
	
	if KeyInput then
		KeyInput.KeyUp:Fire(Input.Scope)
	end
end)

-- Lock the library
local function Lock(t)
	local proxy = setmetatable({},{
		__index = function(_,k)
			if type(t[k]) == "table" then
				return Lock(t[k])
			else
				return t[k]
			end
		end,
		__newindex = function()
			warn("Cannot change a protected table")
		end,
		__metatable = "Metatable is locked"
	})
	return proxy
end

-- Return 
return Lock(Input)
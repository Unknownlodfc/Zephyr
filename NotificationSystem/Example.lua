--Notification Example, is the title

--This is a notification message, is the description/info

--5, is the duration

--RightTop (Right Top of the Screen)
--LeftTop (Left Top of thd Screen)
--RightBottom (Right Bottom of the Screen)
--LeftBottom (Left Bottom of the Screen)

--255, 255, 255 is the title color. (you can find these colors at: https://htmlcolorcodes.com)

--if it doesn't work go to this website: https://github.com/Unknownlodfc/Zephyr/blob/main/NotificationSystem/If%20it%20doesn't%20work.lua
local createNotification = loadstring(game:HttpGet("https://raw.githubusercontent.com/Unknownlodfc/Zephyr/refs/heads/main/NotificationSystem/Notification.lua"))()

createNotification("Right Top", "This is a notification message.", 5, RightTop, 255, 255, 255)

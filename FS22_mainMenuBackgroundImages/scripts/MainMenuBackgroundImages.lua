local modName = g_currentInternalModName
local modDir = g_currentInternalModDirectory

MainMenuSound = {}

function MainMenuSound:loadMods()
	local num = 17
	local imagesDir = modDir .. "data/images/"
	local blurImagesDir = modDir .. "data/blur_images/"

	local function formatImagesString(dir)
		local str = ""

		for i = 1, num do
			str = str .. dir .. tostring(i) .. ".png"

			if i ~= num then
				str = str .. ";"
			end
		end

		return str
	end

	local imageFilenames = formatImagesString(modDir .. "data/images/")
	local blurImagesFilenames = formatImagesString(modDir .. "data/blur_images/")
	local mainBlurImageFilename = modDir .. "data/blur_images/1.png"
	local fadeInterval = "5000"
	local fadeTime = "1000"

	local loadFromXMLOld = GuiProfile.loadFromXML

	GuiProfile.loadFromXML = function(guiProfile, xmlFile, key, presets, isTrait, isVariant)
		local retValue = loadFromXMLOld(guiProfile, xmlFile, key, presets, isTrait, isVariant)
		local profileName = guiProfile.name

		if profileName == "backgroundImage" then
			guiProfile.values.imageFilenames = imageFilenames
			guiProfile.values.fadeInterval = fadeInterval
			guiProfile.values.fadeTime = fadeTime
		elseif profileName == "uiFullBlurBG" or profileName == "mainScreenBackgroundBlur" then
			guiProfile.values.imageFilenames = blurImagesFilenames
			guiProfile.values.imageFilename = mainBlurImageFilename
			guiProfile.values.fadeInterval = fadeInterval
			guiProfile.values.fadeTime = fadeTime
		elseif profileName == "mainScreenSidebar" then
			guiProfile.values.imageFilename = mainBlurImageFilename
		end

		return retValue
	end
end

function MainMenuSound:loadGame()
end

function MainMenuSound:mouseEvent(posX, posY, isDown, isUp, button)
end

function MainMenuSound:keyEvent(unicode, sym, modifier, isDown)
end

function MainMenuSound:update(dt)
end

function MainMenuSound:draw()
end

addInternalModEventListener(MainMenuSound)

function onCreate()
	--setProperty('scoreTxt.visible', false)
	-- CHARACTER
	setPropertyFromClass('GameOverSubstate', 'characterName', 'D-dead');
	
	--SOUNDS
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx'); --file goes inside sounds/ folder
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver'); --file goes inside music/ folder
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd'); --file goes inside music/ folder
    --tween
	makeLuaSprite('y-shine', 'y-shine',425,180);
	addLuaSprite('y-shine');
  
	doTweenAlpha('y-shinetween','y-shine',0,0.1,linear)
	setObjectCamera('y-shine','hud');
	
	makeLuaSprite('y', 'y', -600, -300);
	addLuaSprite('y');
	doTweenAlpha('ytween','y',0,0.1,linear)
	setObjectCamera('y','hud');
  
	makeLuaSprite('weird_ydan', 'weird_ydan',1400,180);
	addLuaSprite('weird_ydan');
	
	setObjectCamera('weird_ydan','hud');
	
	
	--
	makeLuaText('ccc', '芹菜@!#e04ㄑㄘ$%&?!',450,450,550);
	setTextSize('ccc',32);
	setTextFont('ccc','TaipeiSansTCBeta-Bold.ttf');
	setTextColor('ccc','FCEA63');
	
end

playVideo = true;
--playDialogue = true;

function onStartCountdown()
	if isStoryMode and not seenCutscene then
		if playVideo then --Video cutscene plays first
			startVideo('2200p'); --Play video file from "videos/" folder
			playVideo = false;
			return Function_Stop; --Prevents the song from starting naturally
		
		end
	end
	return Function_Continue; --Played video and dialogue, now the song can start normally
end

function onStepHit()
	if curStep == 251 then
		addLuaText('ccc');
	end
	if curStep == 256 then
		removeLuaText('ccc',true);
	end

	
	if curStep == 493 then
		doTweenX('weird_ydantween','weird_ydan',-1000,1.5,linear);
		
	end

	if curStep == 532 then
		doTweenAlpha('y-shinetween2','y-shine',1,0.6,linear);
		
	end

	

	if curStep == 537 then
		
		doTweenAlpha('ytween','y',1,0.6,linear);
	end
	
   

    if curStep == 551 then
      doTweenAlpha('y-shinetween2','y-shine',0,1,linear);
      doTweenY('y-shinetween','y-shine',-500,1.8,linear);
      
	  

    end

    if curStep == 558 then
      doTweenAlpha('ytween','y',0,1.5,linear);
      
    end

end


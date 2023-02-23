
--How makeLuaSprite works:
--makeLuaSprite(<SPRITE VARIABLE>, <SPRITE IMAGE FILE NAME>, <X>, <Y>);
--"Sprite Variable" is how you refer to the sprite you just spawned in other methods like "setScrollFactor" and "scaleObject" for example

--so for example, i made the sprites "stagelight_left" and "stagelight_right", i can use "scaleObject('stagelight_left', 1.1, 1.1)"
--to adjust the scale of specifically the one stage light on left instead of both of them
--scaleObject是物件大小
function onCreate()
	-- background shit
	makeLuaSprite('nightSky', 'nightSky', -600, -300);
	setScrollFactor('nightSky', 1.1, 1.1);
	makeLuaSprite('nightCloud', 'nightCloud', -700, -200);
	setScrollFactor('nightCloud', 0.7, 0.7);
	--makeLuaSprite('stagefront', 'stagefront', -650, 600);
	--setScrollFactor('stagefront', 0.9, 0.9);
	--scaleObject('stagefront', 1.1, 1.1);
	makeLuaSprite('satgeBack', 'satgeBack', -600, -300);
	setScrollFactor('satgeBack', 0.9, 0.9);
	makeLuaSprite('water', 'water', 1200, -100);
	setScrollFactor('water', 0.9, 0.9);
	--makeLuaSprite('step', 'step', -600, -320);
	--setScrollFactor('step', 1.0, 1.0);
	
	makeLuaSprite('blueLight', 'blueLight', -600, -400);
	setScrollFactor('blueLight', 1.1, 1.1);
	
	-- sprites that only load if Low Quality is turned off
	if not lowQuality then
		
		makeLuaSprite('stageFont', 'stageFont', -500, 800);
		setScrollFactor('stageFont', 1.3, 1.3);
		scaleObject('stageFont', 0.9, 0.9);


      --windoow--> star1
	 makeLuaSprite('star1', 'star1', -600, -350);
	--makeLuaSprite('star1', 'philly/star1', -10, 0);
	 setScrollFactor('star1', 1.1, 1.1);
	 scaleObject('star1', 1, 1);
	 setProperty('star1.visible', false)
     
	 --做動畫
	 makeAnimatedLuaSprite('goldfish', 'goldfish', 1320, -30);
	addAnimationByPrefix('goldfish', 'idle', 'goldfish Idle', 24, true);
	scaleObject('goldfish', 0.85, 0.85);
	setScrollFactor('goldfish', 0.9, 0.9);
	
	
	makeAnimatedLuaSprite('eyeBii', 'eyeBii', -300, 185);
	addAnimationByPrefix('eyeBii', 'idle', 'eyeBii Idle', 24, true);
	scaleObject('eyeBii', 0.85, 0.85);
	--setScrollFactor('eyeBii', 0.9, 0.9);

	makeAnimatedLuaSprite('montor', 'montor', 180, -300);
	addAnimationByPrefix('montor', 'idle', 'montor Idle', 12, false);
	--addAnimationByPrefix('montor', 'tf', 'montor ToFace', 24, false);
	--addAnimationByPrefix('montor', 'ti', 'montor ToIdle', 24, false);
	--addAnimationByPrefix('montor', 'face', 'montor Face', 24, false);
	
	setScrollFactor('montor', 0.9, 0.9);

	 end

    --做動畫
	
	
	makeAnimatedLuaSprite('stootstar', 'stootstar', -450, -400);
	addAnimationByPrefix('stootstar', 'stopp', 'stootstar Ttop', 3, false);
	--如果大小是1>>>> makeAnimatedLuaSprite('stootstar', 'stootstar', -570, -270);
	addAnimationByPrefix('stootstar', 'idle', 'stootstar Idle', 24, true);
	--scaleObject('stootstar', 0.9, 0.9);
	setScrollFactor('stootstar', 0.9, 0.9);


	
	
	--添加所有
	addLuaSprite('nightSky', false);
	
	addLuaSprite('stootstar', false);
	addLuaSprite('nightCloud', false);
	--addLuaSprite('stagefront', false);
	addLuaSprite('satgeBack', false);
	addLuaSprite('water', false);
	--addLuaSprite('step', false);
	addLuaSprite('stageFont', false);
    --windoow
	
	addLuaSprite('eyeBii', false);
	addLuaSprite('montor', false);

    addLuaSprite('blueLight', false);
	addLuaSprite('goldfish', false);
	addLuaSprite('star1', false);

	--芹菜掉落
	makeAnimatedLuaSprite('celery', 'celery', 400, -500);
	addAnimationByPrefix('celery', 'idle', 'Celery Idle', 3, false);
	addAnimationByPrefix('celery', 'hey', 'Celery Fall', 18, false);
	
	addLuaSprite('celery', false);
	
	setObjectOrder('celery', 20);
end

starLightsColors = {
	'FFFFFF',
	'FEFFB1',
	'66E5FF'
};

heyTimer = 0;

function onUpdate(elapsed)
	
	setProperty('star1.alpha', getProperty('star1.alpha') - (crochet / 1000) * elapsed * 1.5);

	if heyTimer > 0 then
		heyTimer = heyTimer - elapsed;
		if heyTimer <= 0 then
			playAnim('celery', 'idle', true);
			playAnim('eyeBii', 'idle', true);
			playAnim('goldfish', 'idle', true);
			playAnim('stootstar', 'stopp', true);
			heyTimer = 0;
		end
	end
end

--設置hey事件
function onEvent(name, value1, value2)
	if name == 'Hey!' then
		value1 = tonumber(value1);
		if value1 == nil then
			value1 = 0;
		end

		value2 = tonumber(value2);
		if value2 == nil then
			value2 = 0.6;
		end

		--
		if value1 == 3 then
			playAnim('celery', 'hey', true);
			heyTimer = value2;
		end
		--
		if value1 ~= 5 then
			--playAnim('celery', 'hey', true);
			heyTimer = value2;
		end

		


	end
end









function onBeatHit()
	

	if curBeat % 4 == 0 then
		for i = 0, 4 do
			setProperty('star1.visible', false)
			--playAnim('montor', 'idle', true);
			
		end
		
		
		curLight = getRandomInt(0, 4);
		setProperty('star1.visible', true)
		setProperty('star1.alpha', 1)
		setProperty('star1.color', getColorFromHex(starLightsColors[getRandomInt(0, #starLightsColors)]));
	end
	
	if curBeat % 20 == 0 then
		for i = 0, 4 do
			playAnim('montor', 'idle', true);
			playAnim('stootstar', 'idle', true);
		end
		
	end
	

	
	
end

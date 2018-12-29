
% name:       
% usage:      --
% author:     [[
% date:       2017/10/26 09:01:48
% env:        MATLAB r2016b, WINDOWS 10
% version:    1.0

rng(0)

gameMap = zeros(9);
gameMap(:,1) = randperm(9)';

mapInfo = cell(81, 1);

aa = 10;
debugCount = 0;

while aa <= 81

    debugCount = debugCount + 1;
    
    % ��������������
    if aa < 10
        keyboard
    end

    if isempty(mapInfo{aa})

        % ���ε���, ��ȡ�ڵ���Ϣ
        temp = possibleNum(gameMap, aa);
        mapInfo{aa} = temp;

    else

        % ���ݵ���, ��֦
        temp = mapInfo{aa};
        temp = temp(temp ~= gameMap(aa));
        mapInfo{aa} = temp;

    end



    if isempty(temp)

        % �ڵ��޷����, ����
        gameMap(aa) = 0;
        aa = aa - 1;

    else

        % �ڵ�������, ��䲢ǰ��
        gameMap(aa) = temp(1);
        aa = aa + 1;

    end

end

for aa = 1:81
    if ~checkUnique(gameMap, aa)
        disp ��������
        break
    end
end

disp(gameMap)

function isUnique = checkUnique(gameMap, ind)

[x, y] = ind2sub([9, 9], ind);
isUnique = true;

% �����
ChosenRow = gameMap(x,gameMap(x,:)>0);
if length(unique(ChosenRow)) < length(ChosenRow)
    isUnique = false;
end

% �����
ChosenCol = gameMap(gameMap(:,y)>0,y);
if length(unique(ChosenCol)) < length(ChosenCol)
    isUnique = false;
end

% �������
areaX = 3 * floor(x/3.01) + (1:3);
areaY = 3 * floor(y/3.01) + (1:3);
ChosenArea = reshape(gameMap(areaX, areaY), 1, []);
ChosenArea = ChosenArea(ChosenArea>0);
if length(unique(ChosenArea)) < length(ChosenArea)
    isUnique = false;
end


end


function rsl = possibleNum(gameMap, ind)

[x, y] = ind2sub([9, 9], ind);
areaX = 3 * floor(x/3.01) + (1:3);
areaY = 3 * floor(y/3.01) + (1:3);

ChosenRow = gameMap(x,:);
ChosenCol = gameMap(:,y);
ChosenArea = reshape(gameMap(areaX, areaY), 1, []);

used = unique([ChosenRow, ChosenCol', ChosenArea]);
rsl = setdiff(1:9, used);

end










    % ��������
    % for bb = 1:length(temp)
    %     gameMap = temp(1);
    %     if checkUnique(gameMap, aa)
    %         break
    %     end
    %     temp(1) = [];
    % end

    % % ���½ڵ���Ϣ
    % mapInfo{aa} = temp;
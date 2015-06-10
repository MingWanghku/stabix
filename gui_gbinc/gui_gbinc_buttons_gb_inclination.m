% Copyright 2013 Max-Planck-Institut f�r Eisenforschung GmbH
function handles = gui_gbinc_buttons_gb_inclination(x0, hu, wu)
%% Function to create buttons/boxes for the loading/setting of images
% x0: origin of x coordinate
% hu: heigth unit
% wu: width unit
%
% authors: d.mercier@mpie.de / c.zambaldi@mpie.de

h = uibuttongroup('visible', 'on', 'Position', [x0 hu*2.3 wu*3 x0*8]);

x0 = 0.01;
hu = 0.1; % height unit
wu = 0.1; % width unit

%% Get GB distance
handles.calculation = set_pushbutton('GB DISTANCE', ...
    [x0 hu wu*3 x0*80], 'gui_gbinc_gb_distance', h);

%% Get GB inclination
handles.distance_calculation = set_pushbutton('GB INCLINATION', ...
    [x0*32 hu wu*2.3 x0*80], 'gui_gbinc_gb_inclination_calculation', h);

handles.distance_str = uicontrol('Parent', h,...
    'Units', 'normalized',...
    'Style', 'text',...
    'Position', [x0*57 hu*5 wu*1.5 x0*40],...
    'String', 'Distance');

handles.distance = uicontrol('Parent', h,...
    'Units', 'normalized',...
    'Style', 'edit',...
    'Position', [x0*57 hu*2 wu*1.5 x0*40],...
    'BackgroundColor', [1 1 1]);

handles.distance_unit = uicontrol('Parent', h,...
    'Units', 'normalized',...
    'Style', 'text',...
    'Position', [x0*72 hu*2 wu x0*40],...
    'String', 'um');

handles.inclination_str = uicontrol('Parent', h,...
    'Units', 'normalized',...
    'Style', 'text',...
    'Position', [x0*77 hu*5 wu*1.5 x0*40],...
    'String', 'GB inclination');

handles.inclination = uicontrol('Parent', h,...
    'Units', 'normalized',...
    'Style', 'edit',...
    'Position', [x0*77 hu*2 wu*1.5 x0*40],...
    'BackgroundColor', [1 1 1]);

handles.inclination_unit = uicontrol('Parent', h,...
    'Units', 'normalized',...
    'Style', 'text',...
    'Position', [x0*92 hu*2 wu*0.5 x0*40],...
    'String', '�');

set([handles.distance_str, handles.distance_unit, ...
    handles.inclination_str, handles.inclination_unit], ...
    'HorizontalAlignment', 'left');

end
% Copyright 2013 Max-Planck-Institut f�r Eisenforschung GmbH
function preCPFE_mesh_level(ratio)
%% Function to set the mesh level

gui = guidata(gcf);

lvl0 = ...
    str2num(get(gui.handles.other_setting.mesh_quality_lvl_val, 'String'));

lvl = lvl0 + ratio;

set(gui.handles.other_setting.mesh_quality_lvl_val, ...
    'String', num2str(round(10*lvl)/10));

if ~isempty(strfind(gui.description, 'bicrystal')) || ...
        ~isempty(strfind(gui.description, 'Scratch'))
    if (lvl0 > lvl && lvl > 1) || (lvl0 < lvl && lvl < 1)
        gui.variables.box_elm_nx  = ...
            round(str2num(get(gui.handles.mesh.box_elm_nx_val, 'String'))...
            / lvl);
        gui.variables.box_elm_nz  = ...
            round(str2num(get(gui.handles.mesh.box_elm_nz_val, 'String'))...
            / lvl);
        gui.variables.box_elm_ny1 = ...
            round(str2num(get(gui.handles.mesh.box_elm_ny1_val, 'String'))...
            / lvl);
        gui.variables.box_elm_ny2 = ...
            round(str2num(get(gui.handles.mesh.box_elm_ny2_val, 'String'))...
            / lvl);
        gui.variables.box_elm_ny3 = ...
            round(str2num(get(gui.handles.mesh.box_elm_ny3_val, 'String'))...
            / lvl);
    elseif (lvl0 < lvl && lvl > 1) || (lvl0 > lvl && lvl < 1)
        gui.variables.box_elm_nx  = ...
            round(str2num(get(gui.handles.mesh.box_elm_nx_val, 'String'))...
            * lvl);
        gui.variables.box_elm_nz  = ...
            round(str2num(get(gui.handles.mesh.box_elm_nz_val, 'String'))...
            * lvl);
        gui.variables.box_elm_ny1 = ...
            round(str2num(get(gui.handles.mesh.box_elm_ny1_val, 'String'))...
            * lvl);
        gui.variables.box_elm_ny2 = ...
            round(str2num(get(gui.handles.mesh.box_elm_ny2_val, 'String'))...
            * lvl);
        gui.variables.box_elm_ny3 = ...
            round(str2num(get(gui.handles.mesh.box_elm_ny3_val, 'String'))...
            * lvl);
    else
        gui.variables.box_elm_nx  = ...
            str2num(get(gui.handles.mesh.box_elm_nx_val, 'String'));
        gui.variables.box_elm_nz  = ...
            str2num(get(gui.handles.mesh.box_elm_nz_val, 'String'));
        gui.variables.box_elm_ny1 = ...
            str2num(get(gui.handles.mesh.box_elm_ny1_val, 'String'));
        gui.variables.box_elm_ny2 = ...
            str2num(get(gui.handles.mesh.box_elm_ny2_val, 'String'));
        gui.variables.box_elm_ny3 = ...
            str2num(get(gui.handles.mesh.box_elm_ny3_val, 'String'));
    end
    
    set(gui.handles.mesh.box_elm_nx_val, ...
        'String', num2str(gui.variables.box_elm_nx));
    set(gui.handles.mesh.box_elm_nz_val, ...
        'String', num2str(gui.variables.box_elm_nz));
    set(gui.handles.mesh.box_elm_ny1_val, ...
        'String', num2str(gui.variables.box_elm_ny1));
    set(gui.handles.mesh.box_elm_ny2_val, ...
        'String', num2str(gui.variables.box_elm_ny2));
    set(gui.handles.mesh.box_elm_ny3_val, ...
        'String', num2str(gui.variables.box_elm_ny3));
    
elseif strfind(gui.description, 'single')
    if (lvl0 > lvl && lvl > 1) || (lvl0 < lvl && lvl < 1)
        gui.variables.box_elm_nx = ...
            round(str2num(get(gui.handles.mesh.box_elm_nx_val, 'String'))...
            / lvl);
        gui.variables.box_elm_nz = ...
            round(str2num(get(gui.handles.mesh.box_elm_nz_val, 'String'))...
            / lvl);
        gui.variables.radial_divi = ...
            round(str2num(get(gui.handles.mesh.radial_divi_val, 'String'))...
            / lvl);
    elseif (lvl0 < lvl && lvl > 1) || (lvl0 > lvl && lvl < 1)
        gui.variables.box_elm_nx = ...
            round(str2num(get(gui.handles.mesh.box_elm_nx_val, 'String'))...
            * lvl);
        gui.variables.box_elm_nz = ...
            round(str2num(get(gui.handles.mesh.box_elm_nz_val, 'String'))...
            * lvl);
        gui.variables.radial_divi = ...
            round(str2num(get(gui.handles.mesh.radial_divi_val, 'String'))...
            * lvl);
    else
        gui.variables.box_elm_nx = ...
            str2num(get(gui.handles.mesh.box_elm_nx_val, 'String'));
        gui.variables.box_elm_nz = ...
            str2num(get(gui.handles.mesh.box_elm_nz_val, 'String'));
        gui.variables.radial_divi = ...
            str2num(get(gui.handles.mesh.radial_divi_val, 'String'));
    end
    
    set(gui.handles.mesh.box_elm_nx_val, ...
        'String', num2str(gui.variables.box_elm_nx));
    set(gui.handles.mesh.box_elm_nz_val, ...
        'String', num2str(gui.variables.box_elm_nz));
    set(gui.handles.mesh.radial_divi_val, ...
        'String', num2str(gui.variables.radial_divi));
    
end

gui.variables.mesh_quality_lvl = lvl;

guidata(gcf, gui);

end
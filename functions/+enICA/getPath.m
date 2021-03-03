function topFolder = getPath(varargin)
%
%
% This functions defines the base folder where the data to load, or results
% to save are located.
%
% quick switch between different machines
if ispc()
    % windows machine, octave's assumed
    dataFolder = 'D:\dataEnrico';
elseif ismac()
    % mac machine, Enrico!
    dataFolder = '/Users/enricovarano/Documents/PhD/03B_EEG_analysis/data_2020/eegTrials';
elseif isunix()
    % linux machinen octave's # assumed
    dataFolder = '/run/media/octave/MEGdataBKP/enricoData';
else

end
%
%
switch varargin{1}
    
    case 'EEG'
        % where the EEG data is located
        % varargin{2}: 'raw' or 'processed'
        topFolder = fullfile(dataFolder,varargin{2});
        
    case 'chanLocs'
        % full path to montage file
        topFolder = fullfile(dataFolder,'chanLocs-64.mat');
        
    case 'ICA_tmpdir'
        % full path to where binica / AMICA should write their tmp files
        if ismac()
            topFolder = fullfile(dataFolder,'icaouttmp');
        else
            topFolder = '/home/octave/icaouttmp';
            warning('ICA_tmpdir set as: /home/octave/icaouttmp, are you sure?')
        end
        
    otherwise
        error('Unrecognised option.')
end
end
%
%
function test_bug1567

% MEM 1gb
% WALLTIME 00:10:00
% DEPENDENCY
% DATA private

fileloc = dccnpath('/project/3031000.02/test/bug1567/');

datasets = {'test0001.eeg';
            'test0001.vhdr';
            'test0001-dat.dat';
            'test0001-dat.vhdr';
            'test0002-seg.seg';
            'test0002-seg.vhdr'};
          
%  load datasets
cfg = [];
cfg.continuous = 'yes';
cfg.channel = {'1'};
for i=1:numel(datasets) 
   cfg.dataset = [fileloc datasets{i}];
   if strcmp(datasets{i}(10:12),'seg')
     cfg.continuous = 'no';
   end
   data = ft_preprocessing(cfg);
end

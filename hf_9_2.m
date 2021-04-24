function [t2] = f102()
    t2 = sortrows(readtable('country_data.xls'), 7, 'descend');
    summary(t2(1:10, 4:7))
    writetable(t2, 'country_data_reordered.csv', 'WriteVariableNames', true, 'FileType', 'text', 'Delimiter', '|');
    
end

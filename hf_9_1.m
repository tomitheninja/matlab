function tbl = f91()
    t = 0:0.001:pi;
    y = 5*sin(3*exp(t));
    jegyek = ["elegtelen", "elegseges", "kozepes", "jo", "jeles"];
% translate('vagy') = 'es'
    tbl=table(t', y', jegyek(round(max(1, abs(y))))', 'VariableNames', {'ido','eredmeny','ertekeles'});
    
end

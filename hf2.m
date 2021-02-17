function [c,d,e,f] = vectorIndexing1(x,y)
    a = y(1);
    b = y(2);
    is_in_interval = a <= x & x <= b;
    c = x(is_in_interval);
    d = mean(c);
    [val, idx] = max(c);
    e = [val, idx];
    f = length(c);
end

function [B,C,d,e]=myFunction(A)
    B = A(:, 1, :);
    B = squeeze(B);
    C = A(:, 2, :);
    C = squeeze(C);

    maxs_of_row = max(B');
    d = sum(maxs_of_row);

    mins_of_col = cummin(C);
    mins_of_col = mins_of_col(end, :);
    % or
    mins_of_col = min(C);

    e = mean(mins_of_col);
    
end

% works most of the time
function [min_tav, legkozelebb, max_tav, legtavolabb, atlag_tav, kozel, utvonal] = varos_tavok(tavolsag, varos, x, utvonalhoz)
    A2 = tavolsag;
    A2(A2 == 0) = Inf;
    
    [min_tav, min_city1_idx]=min(min(A2));
    from_min = A2(:, min_city1_idx);
    [~, min_city2_idx]=min(from_min);
    legkozelebb = sort([ varos(min_city1_idx) varos(min_city2_idx) ]);
    
    [max_tav, max_city1_idx]=max(max(tavolsag));
    from_max = tavolsag(:, max_city1_idx);
    [~, max_city2_idx]=max(from_max);
    legtavolabb = sort([ varos(max_city1_idx) varos(max_city2_idx) ]);
    atlag_tav=sum(sum(tavolsag))/(18*19);
    dist_from_bp = tavolsag(1, :);
    kozel = varos(dist_from_bp < x);
    kozel = kozel(2:end);
    kozel = sort(kozel);
    
    % path:
    % u(1) u(2)
    % u(2) u(3)
    % u(3) u(4)
    path = cat(1, utvonalhoz, [utvonalhoz(2:end) utvonalhoz(end)])';
    path = path(1:end-1, :);
    % fuck ind2sub
    % all my homies use matrix multiplication
    idx_of_routes = path * [19;1] - 19;
    distances = tavolsag(idx_of_routes);
    utvonal=sum(distances);
end

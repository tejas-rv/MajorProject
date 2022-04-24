function out = laplacian_pyramid(img, level)
h = 1/16* [1, 4, 6, 4, 1];
out{1} = img;
temp_img = img;

for i = 2 : level
    temp_img = temp_img(1 : 2 : end, 1 : 2 : end);
    out{i} = temp_img;
end
                            
for i = 1 : level - 1                                                       % calculate the DoG
    [m, n] = size(out{i});
    out{i} = out{i} - imresize(out{i+1}, [m, n]);
end
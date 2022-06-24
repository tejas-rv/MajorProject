function z = psnr_1(x,y)
X=double(x);Y=double(y);
[nx,ny]=size(X);
%z = 10.0*log10(norm(X-Y,'fro')^2/(nx*ny));
%%%%%%%%%%%%%%%%%%%Modification 5/6/06%%%%%%%%%%%%%%%%
%http://bmrc.berkeley.edu/courseware/cs294/fall97/assignment/psnr.html
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
M_S_E=0;
for i=1:nx
    for j=1:ny
       M_S_E=M_S_E+((X(i,j)-Y(i,j))^2)/(nx*ny);
    end
end
z=20*log10(255/sqrt(M_S_E));
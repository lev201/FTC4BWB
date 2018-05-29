function [A B p] =parti(A, B)

[nn, mm] = size (B);


p=0;
Br=round(B,5);

for i = 1:nn
    if Br(i,:) == zeros(1, size(B,2))
        p=p+1;
    else
        p=p;
    end
end

A11=A(1:p-1, 1:p-1);
A12=A(1:p-1, p:nn);
A21=A(p:nn, 1:p-1);
A22=A(p:nn, p:nn);

A=cell(2,2);
A{1,1}=A11;
A{1,2}=A12;
A{2,1}=A21;
A{2,2}=A22;

B1=B(1:p-1, 1:mm);
B2=B(p:nn, 1:mm);

B=cell(2,1);
B{1,1}=B1;
B{2,1}=B2;



end

function [EF XS1] = energy( xs1, H, spec , now)
%� ��������� ������� �� �������� ��� ������ xs1 ��� �� ���� ������ ��������
%�� ������������ ������� ��� ���������, ��� ������ � ��� �� ���� ������
%�������� ��� ��� �� mel ������ ��� ����������, ��� ���� spec ��� ����� ��
%������ ��� ������� ��� ������� ��� ��� fft, ��� ��� ���� now ��� ����� ��
%������ ��� ������������� ��������. ���� ����� ���������� ��� ������ �F ���
%�� ���� ������ ��� �������� ��� �������������� ��������� ��� �� ����������
%�������� ��� ��� ������ XS1 ��� �� ���� ������ �������� ��� DFT ���
%����������� ���������.


m = size(xs1,1);        
XS1 = fft(xs1',spec)'; 
FS = zeros(size(XS1));  
EF = zeros(now,24);

for j = 1:24
    for i = 1:m
        FS(i,:) = XS1(i,:).*H(j,:);
        EF(i,j) = sum((abs(FS(i,:)').^2));
    end
end


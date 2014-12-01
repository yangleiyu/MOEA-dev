function Offspring = F_generator(r1,r2,r3,Boundary)
%΢�ֽ���,�������һ���Ӵ�
    
    D = length(r1);
    MaxValue = Boundary(1,:);
    MinValue = Boundary(2,:);

    %΢�ֽ�������
    CR = 1;         %���Ʋ���
    F =0.5;       	%���Ʋ���
    ProM = 1/D;     %�������
    DisM = 20;     	%�������
    
    %΢�ֽ���
    Offspring = r1;
    Temp = rand(1,D)<=CR;
    Offspring(Temp) = Offspring(Temp)+F.*(r2(Temp)-r3(Temp));
    
    %����ʽ����
    k = rand(1,D);
    miu = rand(1,D);
    Temp = (k<=ProM & miu<0.5);
    Offspring(Temp) = Offspring(Temp)+(MaxValue(Temp)-MinValue(Temp)).*((2.*miu(Temp)+(1-2.*miu(Temp)).*(1-(Offspring(Temp)-MinValue(Temp))./(MaxValue(Temp)-MinValue(Temp))).^(DisM+1)).^(1/(DisM+1))-1);
    Temp = (k<=ProM & miu>=0.5);
    Offspring(Temp) = Offspring(Temp)+(MaxValue(Temp)-MinValue(Temp)).*(1-(2.*(1-miu(Temp))+2.*(miu(Temp)-0.5).*(1-(MaxValue(Temp)-Offspring(Temp))./(MaxValue(Temp)-MinValue(Temp))).^(DisM+1)).^(1/(DisM+1)));        
    
    %Խ�紦��
    Offspring(Offspring>MaxValue) = MaxValue(Offspring>MaxValue);
    Offspring(Offspring<MinValue) = MinValue(Offspring<MinValue);
end
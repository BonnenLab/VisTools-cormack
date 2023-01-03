function[y] =vonmisespdf(x,mu,K,a)


y = a(:,1).*exp(K.*cosd(x-mu)) + a(:,2).*exp(K.*cosd(x-mu-180));

% y = max(a).*exp(K.*cosd(x-mu)) + min(a).*exp(K.*cosd(x-mu-180));
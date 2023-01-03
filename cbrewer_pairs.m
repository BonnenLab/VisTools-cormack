function[c]=cbrewer_pairs()

cmp = cbrewer('qual','Set1',9);

c.red = cmp(1,:);
c.blue= cmp(2,:);
c.green= cmp(3,:);
c.purple= cmp(4,:);
c.orange= cmp(5,:);
c.yellow= cmp(6,:);
c.brown= cmp(7,:);
c.pink= cmp(8,:);
c.gray= cmp(9,:);

cmp = cbrewer('qual','Pastel1',9);

c.lred = cmp(1,:);
c.lblue= cmp(2,:);
c.lgreen= cmp(3,:);
c.lpurple= cmp(4,:);
c.lorange= cmp(5,:);
c.lyellow= cmp(6,:);
c.lbrown= cmp(7,:);
c.lpink= cmp(8,:);
c.lgray= cmp(9,:);
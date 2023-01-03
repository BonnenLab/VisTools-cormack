function[c]=cbrewer_colors()

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
c.black = [0,0,0];
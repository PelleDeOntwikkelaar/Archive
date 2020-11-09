x=smallresults1(:,1);
x1=x';
y1= smallresults1(:,2);
y1=y1';
y2= smallresults1(:,3);
y2=y2';
y3= smallresults1(:,4);
y3=y3';
plot(x1,y1,'LineWidth',5)
hold on
plot(x1,y2,'LineWidth',5)
plot(x1,y3,'LineWidth',5)
hold off
legend('Personal Device Sequential','HPC Device Sequential','HPC Device Parallel')
xlabel('Number of Support Vectors Used');
ylabel('Mean Execution time [seconds]');

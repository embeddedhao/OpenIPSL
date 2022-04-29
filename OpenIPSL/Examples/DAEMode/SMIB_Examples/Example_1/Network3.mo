within OpenIPSL.Examples.DAEMode.SMIB_Examples.Example_1;
model Network3 "Single machine infinite bus (SMIB) system simulated with GenEventTest-type generator and fault in bus B2 at t=0.5s."
  extends Modelica.Icons.Example;
    SMIB_Examples.Example_1.Generator.GenEventTest                 G1(P_0 = 1997999000, Q_0 = 967920000, v_0 = 1, V_b = 400000, angle_0 = 0.49460013007)                    annotation (
        Placement(transformation(origin = {-88, 0}, extent = {{-10, -10}, {10, 10}})));
    OpenIPSL.Electrical.Buses.Bus B1(displayPF=true) annotation (
        Placement(transformation(origin = {-60, 0}, extent = {{-10, -10}, {10, 10}})));
    OpenIPSL.Electrical.Buses.Bus B2(displayPF=true) annotation (
        Placement(transformation(origin = {-20, 0}, extent = {{-10, -10}, {10, 10}})));
    OpenIPSL.Electrical.Buses.Bus B3(displayPF=true) annotation (
        Placement(transformation(origin = {40, 0}, extent = {{-10, -10}, {10, 10}})));
    inner OpenIPSL.Electrical.SystemBase SysData(S_b=100000000, fn=60) annotation (
        Placement(transformation(origin = {-70, 85}, extent = {{-30, -15}, {30, 15}})));
    OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer
        twoWindingTransformer(
        Sn=2220000000,
        V_b=400000,
        Vn=400000,
        rT=0.0,
        xT=0.15) annotation (
        Placement(transformation(origin = {-40, 0}, extent = {{-10, -10}, {10, 10}})));
    OpenIPSL.Electrical.Branches.PwLine pwLine1(
        B=0.0,
        G=0.0,
        R=0.0,
        X=0.5*100/2220) annotation (
        Placement(transformation(origin = {10, 20}, extent = {{-10, -10}, {10, 10}})));
    OpenIPSL.Electrical.Branches.PwLine pwLine2(
        B=0.0,
        G=0.0,
        R=0.0,
        X=0.93*100/2220) annotation (
        Placement(transformation(origin = {10, -20}, extent = {{-10, -10}, {10, 10}})));
    OpenIPSL.Electrical.Buses.InfiniteBus infiniteBus(
        P_0=-1998000000,
        Q_0=87066000,
        v_0=0.90081,
        V_b=400000,
        angle_0=0.0) annotation (
        Placement(transformation(origin = {78, 0}, extent = {{10, -10}, {-10, 10}})));
    OpenIPSL.Electrical.Events.PwFault pwFault(
        R=0.0,
        X=0.01*100/2220,
        t1=0.5,
        t2=0.56) annotation (
        Placement(transformation(origin = {2, -38}, extent = {{-6, -6}, {6, 6}})));
equation
      connect(infiniteBus.p, B3.p) annotation (
        Line(points = {{68, 0}, {40, 0}}, color = {0, 0, 255}));
      connect(pwFault.p, B2.p) annotation (
        Line(points={{-5,-38},{-16,-38},{-16,0},{-20,0}},          color = {0, 0, 255}));
      connect(pwLine1.p, B2.p) annotation (
        Line(points={{1,20},{-8,20},{-8,0},{-20,0}},          color = {0, 0, 255}));
      connect(pwLine2.p, B2.p) annotation (
        Line(points={{1,-20},{-8,-20},{-8,0},{-20,0}},          color = {0, 0, 255}));
      connect(pwLine2.n, B3.p) annotation (
        Line(points={{19,-20},{30,-20},{30,0},{40,0},{40,0}},            color = {0, 0, 255}));
      connect(pwLine1.n, B3.p) annotation (
        Line(points={{19,20},{30,20},{30,0},{40,0},{40,0}},            color = {0, 0, 255}));
      connect(twoWindingTransformer.n, B2.p) annotation (
        Line(points={{-29,0},{-20,0},{-20,0},{-20,0}},          color = {0, 0, 255}));
      connect(twoWindingTransformer.p, B1.p) annotation (
        Line(points={{-51,0},{-60,0},{-60,0},{-60,0}},          color = {0, 0, 255}));
      connect(G1.p, B1.p)
        annotation (Line(points={{-77,0},{-60,0}}, color={0,0,255}));
        annotation (
      experiment(
        StartTime=0,
        StopTime=10,
        Tolerance=1e-6,
        Interval=1e-4), Documentation(info="<html>
<p>Simulate the system for 10 seconds. Variables of interest are:</p>
<ul>
<li><code>G1.gENSAL.P</code></li>
<li><code>G1.gENSAL.Q</code></li>
<li><code>G1.gENSAL.Vt</code></li>
<li><code>G1.gENSAL.SPEED</code></li>
</ul>
<p>Compare these results with the ones obtained in the <strong>Network1</strong> and <strong>Network2</strong>.
Compare also with the results obtained from the simulating the systems in <strong>Example_1Mode</strong> and <strong>Example_2</strong>.</p>
</html>"));
end Network3;

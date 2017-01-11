function [y1] = SCGNeuralNetworkFunction(x1)
%MYNEURALNETWORKFUNCTION neural network simulation function.
%
% Generated by Neural Network Toolbox function genFunction, 11-Jan-2017 20:32:34.
%
% [y1] = myNeuralNetworkFunction(x1) takes these arguments:
%   x = Qx30 matrix, input #1
% and returns:
%   y = Qx2 matrix, output #1
% where Q is the number of samples.

%#ok<*RPMT0>

% ===== NEURAL NETWORK CONSTANTS =====

% Input 1
x1_step1.xoffset = [9.878;0;7.33;0.12;0;13.602;-18.066;0.228;0.004;110.601;0.047;-1.414;0;20;-2.496;-3.141;26.001;-2.487;-3.142;0.2;-3.142;22.71;2;30.196;-4.497;-3.142;30;-4.5;-3.142;60.223];
x1_step1.gain = [0.002044318786983;0.00289823569901822;0.00151219242951104;0.00189809687317012;0.235211101964013;0.000403113893582366;0.0575440211761998;0.373761913660998;0.00389366403519872;0.00114819724421179;0.101389029706986;0.707213578500707;2;0.00331750881627968;0.400560785099139;0.318319274232055;0.00458826093439934;0.401123144805455;0.318319274232055;0.00210268902385816;0.318268618714195;0.00100945557032726;2;0.00183422797802962;0.222321031569587;0.318319274232055;0.00289244724176231;0.222222222222222;0.318268618714195;0.0012712860965796];
x1_step1.ymin = -1;

% Layer 1
b1 = [-1.5693273763014643;1.2534055571557781;-0.78591725125399425;-0.7213350379301614;-0.82148994531738306;-0.43113467078175666;0.68173656711878516;-0.90473659854920563;-1.5641449433487071;1.7987371827857854];
IW1_1 = [0.086041024302052072 0.22879568649837215 0.44846729950551301 -0.11181194171723396 -0.48043496631318483 0.54401275718892228 -0.4511499259035136 0.16118363541144035 0.10543114299742207 -0.061885171977328117 0.089652822913727254 0.49744197377978788 0.18753171593701087 0.26684852290418959 -0.16616959253406313 -0.12075470883344751 -0.13456561306829093 0.063960132154895197 -0.20031934292549278 -0.096862909777614345 0.097690381141534902 0.089463050046826212 0.14496421901228881 0.38825152468413543 0.17618620980348704 -0.33508761795049197 -0.11293931499353688 -0.16051612118753308 0.13671548747582163 -0.23183749962845851;-0.40736553409504295 0.0067979530893849931 -0.17906067039264423 -0.4057243471201451 0.30087037514589743 -0.46336293724471606 0.44936306547471677 0.34574444541015104 -0.12041102183912829 -0.27126563191531505 -0.33823026957682351 -0.038834950136107653 -0.30317273130188288 0.084993608405209142 -0.2252586230702677 0.33419760626560263 0.29715875103970135 0.049309904791445085 0.33264721762142413 -0.062976022028808074 0.1856472045593929 0.2637472988451558 -0.1055010148940658 -0.3754509899664768 -0.12153758769512225 0.003238526262738092 -0.27519894985845805 -0.25553520518433193 -0.055712089640143313 -0.36507478745719135;0.42565582834677046 -0.68863161084106483 -0.34247106746847339 0.60338872945617994 0.15272308245940716 0.59118260205381135 -0.11823890144300397 0.60423835472447918 -0.53431566605165903 0.38975719667821923 -0.18041253940840019 0.16081031296992432 0.23196258370653394 0.52267490710454279 -0.048494259729152792 -0.0038141973005905885 -0.14617067852693633 0.064598734770671587 -0.0072771222172509364 -0.18177135549619611 0.075190677768971079 -0.67242913769615986 -0.29078936727969645 0.074386874641266545 -0.018168855449422667 0.025858474931459284 0.0093248547930111954 0.012382098987522393 -0.014724883951258145 -0.52240726118905079;0.1759304584998731 0.77909335567400528 0.33969936388810873 0.0063797689635128052 -0.43106602480974016 -0.18869109827999236 0.18097585110675524 0.45327559310568155 -0.30465834397392533 -0.680296214152464 0.41638305391036345 0.015824077827298874 0.48026475742175506 0.3198848573633577 0.44251595594087284 -0.23066143864992567 0.16080609025732148 -0.69450869579848729 -0.23490965175211448 0.40631675445318677 0.19410538633066263 0.13808711164035137 -0.23353340723037375 -0.41160798908549123 -0.020373035408791491 -0.077842149494250487 -0.15694972206880201 0.22910705485606569 -0.12120683624289964 -0.17583342773266625;0.13577709412891431 1.207480397492503 1.0134445705558806 -0.13476413431813888 -0.15538801222249549 -0.21731690880987931 -0.12995385770385048 -0.17433944370102325 -0.27238527975890281 -0.62718980559168735 1.4559157738185322 -0.14024624844334571 -0.096633694808087561 -0.72254562835362568 0.58746406109673721 0.028085381480797828 -0.9295070884675305 -0.5799658216220851 0.045526460262251031 -0.4412708095758236 0.0073600388217535534 -0.50161283069820928 -0.09906860960937626 0.40049434274118045 -0.038568871446407263 0.031384724770258367 -0.194961250662365 -0.033160959594078693 0.0016137961935733429 0.14786445861419795;0.15172012906874777 0.67823756569092097 0.0882237683235884 0.15640045064969782 0.26080911706858917 0.49859250872119532 -0.12842354101714512 0.029022432099485369 0.2819902506670271 0.5430244572257843 -0.10305378531470812 -0.17191761185237189 0.057655343787785522 0.4602631342594663 0.00535861699029522 0.00022908210844571299 0.59555513087670542 -0.059020092590715036 0.02821025420287885 0.49425853216637733 -0.2081618541965862 -0.31343631380727671 -0.14949075952956753 0.27544621746393466 -0.041707353158443018 0.026329382303403714 -0.1811585297701174 -0.44929327371664735 -0.033570609740876278 0.23386959185129191;0.35251988266887385 -0.53971486313154404 -0.39415282016680586 0.07602703145504669 -0.34746908007403599 0.164220032049049 0.14316929531186856 -0.011072618821465792 -0.34508759570514569 0.19009502307721862 -0.6943564301903673 -0.21420809543418981 -0.10272248695829035 -0.50919500382269001 0.16204701529486865 0.24667853153898839 -0.37369286739441665 -0.27528445198275037 0.090437465816927576 -0.02820310529678741 -0.14125267641397549 -0.28555254574442618 0.019836195638996919 0.40058537135424699 0.038123913520044884 0.2066711110748769 -0.52221050473781783 0.1053075557259624 -0.038665026495175121 -0.10240697258336465;-0.2283028612360696 0.21076505981714602 0.52053507864511905 0.69317849378325891 0.3274610686388979 -0.23437729555885689 0.10484817572631393 -0.53708184292098549 0.34032821367782279 -0.13155098574150476 -0.2917310361772919 0.14939727083561569 0.075006870429158143 0.25170357274971311 -0.12751405266242652 0.13660661867805138 0.31869163808464057 0.15247122627021645 0.115234750760122 -0.0076044326679921741 0.1588418600850377 0.27863303039550025 0.11905664087601492 0.43701743105718388 -0.32896168324730773 0.19450800611168634 0.38882336118378547 0.2428516610616071 -0.14105757820787113 0.0041459833827049309;-0.038313025203770154 0.88316774986555235 0.44977895090450998 -0.42372977572521819 -0.051400429448583987 -0.12658598770986593 0.19273867917810908 -0.35377448684551516 -0.36233931602801472 -0.72014229928567275 0.92315330599007672 -0.03241664637670931 0.056401650734864729 -0.075489410693434025 -1.2485379124961575 -0.01765467212952013 -0.48395500171499461 1.2846111474955519 -0.0036362526479760018 -0.31524052876077951 -0.047334859265768241 0.057380231522946246 -0.18931408651671611 -0.197008643416374 0.028090254829039166 0.0055829328925990299 0.28209099710077612 -0.044947368274799601 0.021378904338321771 0.28971392970861942;-0.098309483748825602 -0.4472842322495586 0.1353685629708635 -0.49819789011002591 -0.013298025098881007 0.10803311319431652 -0.14398390314216294 0.030668254928849368 -0.016482764816538042 0.23451437520628671 -0.5054862993300554 -0.17482728693601463 0.23343955026845434 -0.60358252844925742 -0.24619728182635914 -0.15223903589153942 -0.027164107546835136 0.23317002890235194 -0.27352161592315472 0.20247567958364135 -0.24752279175584829 -0.47461753715324667 -0.088776387744365456 -0.10897615736887135 -0.015125451583648501 -0.36684098458463288 -0.29201121797244017 -0.051203474393542017 -0.043606548335276753 -0.088090204533819827];

% Layer 2
b2 = [-0.45098073707837533;-0.60380086877384187];
LW2_1 = [0.48094976795760119 -0.32548114706656056 -0.088089615926172746 0.068203051286021305 0.38784445196642575 -0.20830037125834322 0.90221140065628203 0.3961785822664497 0.41011546848734159 0.32606383222757596;-0.047640188204420127 0.63913863057968734 -1.0205551687677348 0.33637036315295632 0.83051566693768319 0.28252570350862366 -0.022669992638893983 -0.87531317226659799 1.0130780689329406 0.94335938421483501];

% Output 1
y1_step1.ymin = -1;
y1_step1.gain = [0.256294165406702;2];
y1_step1.xoffset = [0.00150187015894;0];

% ===== SIMULATION ========

% Dimensions
Q = size(x1,1); % samples

% Input 1
x1 = x1';
xp1 = mapminmax_apply(x1,x1_step1);

% Layer 1
a1 = tansig_apply(repmat(b1,1,Q) + IW1_1*xp1);

% Layer 2
a2 = repmat(b2,1,Q) + LW2_1*a1;

% Output 1
y1 = mapminmax_reverse(a2,y1_step1);
y1 = y1';
end

% ===== MODULE FUNCTIONS ========

% Map Minimum and Maximum Input Processing Function
function y = mapminmax_apply(x,settings)
y = bsxfun(@minus,x,settings.xoffset);
y = bsxfun(@times,y,settings.gain);
y = bsxfun(@plus,y,settings.ymin);
end

% Sigmoid Symmetric Transfer Function
function a = tansig_apply(n,~)
a = 2 ./ (1 + exp(-2*n)) - 1;
end

% Map Minimum and Maximum Output Reverse-Processing Function
function x = mapminmax_reverse(y,settings)
x = bsxfun(@minus,y,settings.ymin);
x = bsxfun(@rdivide,x,settings.gain);
x = bsxfun(@plus,x,settings.xoffset);
end
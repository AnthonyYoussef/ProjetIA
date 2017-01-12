%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%DEBUT DE LA FONCTION PRINCIPALE%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function gui_appdata_findobj

%

% Cr�ation de l'objet Figure
figure('units','pixels',...
    'position',[250 250 500 500],...
    'color',[0.925 0.913 0.687],...
    'numbertitle','off',...
    'name','[GUI] Utilisation de SETAPPDATA / GETAPPDATA',...
    'menubar','none',...
    'tag','interface');

% Cr�ation de l'objet Uicontrol Pushbutton -
uicontrol('style','pushbutton',...
    'units','normalized',...
    'position',[0.1 0.1 0.1 0.05],...
    'string','-',...    
    'callback',@retrancher,...
    'tag','bouton-');

% Cr�ation de l'objet Uicontrol Pushbutton +
uicontrol('style','pushbutton',...
    'units','normalized',...
    'position',[0.3 0.1 0.1 0.05],...
    'string','+',...    
    'callback',@ajouter,...
    'tag','bouton+');

% Cr�ation de l'objet Uicontrol Text r�sultat


uicontrol('style','edit',...
    'units','normalized',...
    'position',[0.1 0.2 0.3 0.05],...
    'string','0',...
    'callback',@changer,...
    'tag','resultat');

uicontrol('Style','text',...
                'String','Nombre de couches cach�es :',...
                'Position',[50 150 130 30]);

% Initialisation de la valeur repr�sentant la valeur courante du compteur nCompteur � 0
nCompteur=0;

% Enregistrement direct de nCompteur dans les donn�es d'application de l'objet Figure
setappdata(gcf,'valeur_de_nCompteur',nCompteur);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%FIN DE LA FONCTION PRINCIPALE%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%DEBUT DE LA FONCTION METTRE A JOUR%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function changer(obj,event)

% R�cup�ration directe de nCompteur depuis les donn�es d'application de l'objet Figure
% contenant l'objet graphique dont l'action est ex�cut�e (gcbf)
t = findobj(gcf,'Tag','string');
x=get(t,'string');
nCompteur=num2str(x);
printf(nCompteur);

% R�cup�ration de l'identifiant de l'objet Uicontrol Text r�sultat enfant de l'objet Figure
% contenant l'objet graphique dont l'action est ex�cut�e (gcbf)
h=findobj(gcbf,'style','text','tag','resultat');
% Modification de sa propri�t� String
set(h,'string',num2str(nCompteur));

% Enregistrement de la nouvelle valeur de nCompteur dans les donn�es d'application de l'objet Figure
% contenant l'objet graphique dont l'action est ex�cut�e (gcbf)
setappdata(gcbf,'valeur_de_nCompteur',nCompteur);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%FIN DE LA SOUS-FONCTION RETRANCHER%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%DEBUT DE LA SOUS-FONCTION RETRANCHER%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function retrancher(obj,event)

% R�cup�ration directe de nCompteur depuis les donn�es d'application de l'objet Figure
% contenant l'objet graphique dont l'action est ex�cut�e (gcbf)
nCompteur=getappdata(gcbf,'valeur_de_nCompteur');

% Diminution de la valeur de nCompteur
nCompteur=nCompteur-1;

% R�cup�ration de l'identifiant de l'objet Uicontrol Text r�sultat enfant de l'objet Figure
% contenant l'objet graphique dont l'action est ex�cut�e (gcbf)
h=findobj('parent',gcbf,'style','text','tag','resultat');
% Modification de sa propri�t� String
set(h,'string',num2str(nCompteur));

% Enregistrement de la nouvelle valeur de nCompteur dans les donn�es d'application de l'objet Figure
% contenant l'objet graphique dont l'action est ex�cut�e (gcbf)
setappdata(gcbf,'valeur_de_nCompteur',nCompteur);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%FIN DE LA SOUS-FONCTION RETRANCHER%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%DEBUT DE LA SOUS-FONCTION AJOUTER%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function ajouter(obj,event)

% R�cup�ration directe de nCompteur depuis les donn�es d'application de l'objet Figure
% contenant l'objet graphique dont l'action est ex�cut�e (gcbf)
nCompteur=getappdata(gcbf,'valeur_de_nCompteur');

nCompteur=nCompteur+1;

% R�cup�ration de l'identifiant de l'objet Uicontrol Text r�sultat enfant de l'objet Figure
% contenant l'objet graphique dont l'action est ex�cut�e (gcbf)
h=findobj('parent',gcbf,'style','text','tag','resultat');
% Modification de sa propri�t� String
set(h,'string',num2str(nCompteur));

% Enregistrement de la nouvelle valeur de nCompteur dans les donn�es d'application de l'objet Figure
setappdata(gcbf,'valeur_de_nCompteur',nCompteur);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%FIN DE LA SOUS-FONCTION AJOUTER%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
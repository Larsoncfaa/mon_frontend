import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../vues/commun/splash_et_langue.dart';
import '../vues/auth/connexion.dart';
import '../vues/auth/inscription.dart';
import '../vues/client/tableau_de_bord/ecran_accueil_client.dart';
import '../vues/client/catalogue_page.dart';
import '../vues/client/detail_produit_page.dart';
import '../vues/client/panier_page.dart';
import '../vues/client/paiement_page.dart';
import '../vues/client/commandes_passees_page.dart';
import '../vues/client/detail_commande_page.dart';
import '../vues/client/apres_vente/retour_echange_screen.dart';
import '../vues/client/avis_fidelite_page.dart';
import '../vues/client/profil/profil_screen.dart';
import '../vues/commun/notifications_page.dart';
import '../vues/commun/promotions_page.dart';
import '../vues/client/fidelite/ecran_fidelite.dart';
import '../vues/client/livraisons/ecran_livraisons_client.dart';
import '../vues/agriculteur/tableau_de_bord/tableau_de_bord_agriculteur.dart';
import '../vues/agriculteur/gestion_produits/edition_produit_page.dart';
import '../vues/agriculteur/gestion_stock/gestion_stock_screen.dart';
import '../vues/agriculteur/gestion_stock/gestion_mouvement_screen.dart';
import '../vues/agriculteur/gestion_stock/gestion_alertes_screen.dart';
import '../vues/agriculteur/gestion_livraisons/gestion_livraisons_screen.dart';
import '../vues/agriculteur/gestion_livraisons/details_livraison_screen.dart';
import '../vues/agriculteur/gestion_approvisionnements/ecran_approvisionnements.dart';
import '../vues/agriculteur/gestion_approvisionnements/formulaire_entrepot.dart';
import '../vues/agriculteur/gestion_approvisionnements/formulaire_lot.dart';
import '../vues/agriculteur/profil/ecran_profil_agriculteur.dart';

part 'routeur.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Screen,Route',
)
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(path: '/', page: SplashEtLangueRoute),
    AutoRoute(page: ConnexionEcran, path: '/auth/login'),
    AutoRoute(page: InscriptionEcran, path: '/auth/register'),
    AutoRoute(page: EcranAccueilClient, path: '/client/accueil'),
    AutoRoute(page: CataloguePage, path: '/client/catalogue'),
    AutoRoute(page: DetailProduitPage, path: '/client/produit/:produitId'),
    AutoRoute(page: PanierPage, path: '/client/panier'),
    AutoRoute(page: PaiementPage, path: '/client/paiement/:commandeId'),
    AutoRoute(page: CommandesPasseesPage, path: '/client/commandes'),
    AutoRoute(page: DetailCommandePage, path: '/client/commande/:commandeId'),
    AutoRoute(page: RetourEchangeScreen, path: '/client/apres-vente/:idCommande'),
    AutoRoute(page: AvisFidelitePage, path: '/client/avis-fidelite'),
    AutoRoute(page: ProfilPage, path: '/client/profil'),
    AutoRoute(page: NotificationsPage, path: '/client/notifications'),
    AutoRoute(page: PromotionsPage, path: '/client/promotions'),
    AutoRoute(page: EcranFidelite, path: '/client/fidelite'),
    AutoRoute(page: EcranLivraisonsClient, path: '/client/livraisons'),
    AutoRoute(page: TableauDeBordAgriculteur, path: '/agri/accueil'),
    AutoRoute(page: EditionProduitPage, path: '/agri/produit/edition'),
    AutoRoute(page: GestionStockScreen, path: '/agri/stock'),
    AutoRoute(page: GestionMouvementScreen, path: '/agri/stock/mouvements'),
    AutoRoute(page: GestionAlertesScreen, path: '/agri/stock/alertes'),
    AutoRoute(page: GestionLivraisonsScreen, path: '/agri/livraisons'),
    AutoRoute(page: DetailsLivraisonScreen, path: '/agri/livraison/:idCommande'),
    AutoRoute(page: EcranApprovisionnements, path: '/agri/appro/overview'),
    AutoRoute(page: FormulaireEntrepot, path: '/agri/appro/entrepot'),
    AutoRoute(page: FormulaireLot, path: '/agri/appro/lot'),
    AutoRoute(page: EcranProfilAgriculteur, path: '/agri/profil'),
  ];

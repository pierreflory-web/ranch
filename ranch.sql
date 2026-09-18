-- Le Ranch — colonne de sauvegarde dans la table des joueurs
-- À exécuter une seule fois dans Supabase : SQL Editor → New query → coller → Run

alter table public.players
  add column if not exists ranch jsonb not null default '{}';

-- TRUNCATE all tables to ensure that there are no
-- data in them so we start with a fresh set of data
TRUNCATE blogful_articles, blogful_users, blogful_comments RESTART IDENTITY CASCADE;

-- insert 10 articles
INSERT INTO blogful_articles (title, style, content)
VALUES
  ('First post!', 'Interview',
    'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Natus consequuntur deserunt commodi, nobis qui inventore corrupti iusto aliquid debitis unde non. Adipisci, pariatur. Molestiae, libero esse hic adipisci autem neque?'),
  ('Second post!', 'How-to',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Cum, exercitationem cupiditate dignissimos est perspiciatis, nobis commodi alias saepe atque facilis labore sequi deleniti. Sint, adipisci facere! Velit temporibus debitis rerum.'),
  ('Third post!', 'News',
    'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Possimus, voluptate? Necessitatibus, reiciendis? Cupiditate totam laborum esse animi ratione ipsa dignissimos laboriosam eos similique cumque. Est nostrum esse porro id quaerat.'),
  ('Fourth post', 'How-to',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero, consequuntur. Cum quo ea vero, fugiat dolor labore harum aut reprehenderit totam dolores hic quaerat, est, quia similique! Aspernatur, quis nihil?'),
  ('Fifth post', 'News',
    'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Amet soluta fugiat itaque recusandae rerum sed nobis. Excepturi voluptas nisi, labore officia, nobis repellat rem ab tempora, laboriosam odio reiciendis placeat?'),
  ('Sixth post', 'Listicle',
    'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
  ('Seventh post', 'Listicle',
    'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Sed, voluptatum nam culpa minus dolore ex nisi recusandae autem ipsa assumenda doloribus itaque? Quos enim itaque error fuga quaerat nesciunt ut?'),
  ('Eigth post', 'News',
    'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Consequatur sequi sint beatae obcaecati voluptas veniam amet adipisci perferendis quo illum, dignissimos aspernatur ratione iusto, culpa quam neque impedit atque doloribus!'),
  ('Ninth post', 'Story',
    'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Dignissimos architecto repellat, in amet soluta exercitationem perferendis eius perspiciatis praesentium voluptate nisi deleniti eaque? Rerum ea quisquam dolore, non error earum?'),
  ( 'Tenth post', 'How-to',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Earum molestiae accusamus veniam consectetur tempora, corporis obcaecati ad nisi asperiores tenetur, autem magnam. Iste, architecto obcaecati tenetur quidem voluptatum ipsa quam?');

INSERT INTO blogful_users (fullname, username, password, nickname)
VALUES
  ('Tom', 'tom321', 'abcd', 'tom3'),
  ('Sam', 'sam123', 'qwer', 'sam1'),
  ('Maria', 'maria77', 'zxcv', 'mar1a');


do
$do$
declare
     i int;
begin
for  i in 1..10
loop
    if MOD(i, 2) = 0 then
        UPDATE blogful_articles SET author = 2 WHERE id = i;
    elsif Mod(i, 3) = 0 then 
    	UPDATE blogful_articles SET author = 3 WHERE id = i;
    else
    	UPDATE blogful_articles SET author = 1 WHERE id = i;
    end if;
end loop;
end;
$do$;

INSERT INTO blogful_comments (text, article_id, user_id)
VALUES
  ('good', 1, 3),
  ('great', 2, 1),
  ('wonderful', 1, 2),
  ('normal', 2, 2),
  ('interesting', 4, 3),
  ('fine', 6, 1);
  
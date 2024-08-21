SET FOREIGN_KEY_CHECKS = 0;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";

START TRANSACTION;

SET time_zone = "+00:00";

DROP TRIGGER IF EXISTS blog_categories_before_insert;

CREATE TRIGGER blog_categories_before_insert BEFORE INSERT ON blog_categories 
  FOR EACH ROW BEGIN
    IF NEW.id IS NULL THEN
      SET NEW.id=UUID();
    END IF;
  END;

DROP TRIGGER IF EXISTS blog_posts_before_insert;

CREATE TRIGGER blog_posts_before_insert BEFORE INSERT ON blog_posts 
  FOR EACH ROW BEGIN
    IF NEW.id IS NULL THEN
      SET NEW.id=UUID();
    END IF;
  END;

DROP TRIGGER IF EXISTS blog_post_categories_before_insert;

CREATE TRIGGER blog_post_categories_before_insert BEFORE INSERT ON blog_post_categories 
  FOR EACH ROW BEGIN
    IF NEW.id IS NULL THEN
      SET NEW.id=UUID();
    END IF;
  END;

DROP TRIGGER IF EXISTS blog_post_comments_before_insert;

CREATE TRIGGER blog_post_comments_before_insert BEFORE INSERT ON blog_post_comments 
  FOR EACH ROW BEGIN
    IF NEW.id IS NULL THEN
      SET NEW.id=UUID();
    END IF;
  END;

DROP TRIGGER IF EXISTS oauths_before_insert;

CREATE TRIGGER oauths_before_insert BEFORE INSERT ON oauths 
  FOR EACH ROW BEGIN
    IF NEW.id IS NULL THEN
      SET NEW.id=UUID();
    END IF;
  END;

DROP TRIGGER IF EXISTS industries_before_insert;

CREATE TRIGGER industries_before_insert BEFORE INSERT ON industries 
  FOR EACH ROW BEGIN
    IF NEW.id IS NULL THEN
      SET NEW.id=UUID();
    END IF;
  END;

DROP TRIGGER IF EXISTS enterprise_categories_before_insert;

CREATE TRIGGER enterprise_categories_before_insert BEFORE INSERT ON enterprise_categories 
  FOR EACH ROW BEGIN
    IF NEW.id IS NULL THEN
      SET NEW.id=UUID();
    END IF;
  END;

DROP TRIGGER IF EXISTS enterprises_before_insert;

CREATE TRIGGER enterprises_before_insert BEFORE INSERT ON enterprises 
  FOR EACH ROW BEGIN
    IF NEW.id IS NULL THEN
      SET NEW.id=UUID();
    END IF;
  END;

DROP TRIGGER IF EXISTS enterprise_category_links_before_insert;

CREATE TRIGGER enterprise_category_links_before_insert BEFORE INSERT ON enterprise_category_links 
  FOR EACH ROW BEGIN
    IF NEW.id IS NULL THEN
      SET NEW.id=UUID();
    END IF;
  END;

DROP TRIGGER IF EXISTS enterprise_field_of_activities_before_insert;

CREATE TRIGGER enterprise_field_of_activities_before_insert BEFORE INSERT ON enterprise_field_of_activities 
  FOR EACH ROW BEGIN
    IF NEW.id IS NULL THEN
      SET NEW.id=UUID();
    END IF;
  END;

DROP TRIGGER IF EXISTS enterprise_industries_before_insert;

CREATE TRIGGER enterprise_industries_before_insert BEFORE INSERT ON enterprise_industries 
  FOR EACH ROW BEGIN
    IF NEW.id IS NULL THEN
      SET NEW.id=UUID();
    END IF;
  END;

DROP TRIGGER IF EXISTS enterprise_profiles_before_insert;

CREATE TRIGGER enterprise_profiles_before_insert BEFORE INSERT ON enterprise_profiles 
  FOR EACH ROW BEGIN
    IF NEW.id IS NULL THEN
      SET NEW.id=UUID();
    END IF;
  END;

DROP TRIGGER IF EXISTS locations_before_insert;

CREATE TRIGGER locations_before_insert BEFORE INSERT ON locations 
  FOR EACH ROW BEGIN
    IF NEW.id IS NULL THEN
      SET NEW.id=UUID();
    END IF;
  END;

DROP TRIGGER IF EXISTS location_staff_before_insert;

CREATE TRIGGER location_staff_before_insert BEFORE INSERT ON location_staff 
  FOR EACH ROW BEGIN
    IF NEW.id IS NULL THEN
      SET NEW.id=UUID();
    END IF;
  END;

DROP TRIGGER IF EXISTS departments_before_insert;

CREATE TRIGGER departments_before_insert BEFORE INSERT ON departments 
  FOR EACH ROW BEGIN
    IF NEW.id IS NULL THEN
      SET NEW.id=UUID();
    END IF;
  END;

DROP TRIGGER IF EXISTS staff_before_insert;

CREATE TRIGGER staff_before_insert BEFORE INSERT ON staff 
  FOR EACH ROW BEGIN
    IF NEW.id IS NULL THEN
      SET NEW.id=UUID();
    END IF;
  END;

DROP TRIGGER IF EXISTS staff_role_permissions_before_insert;

CREATE TRIGGER staff_role_permissions_before_insert BEFORE INSERT ON staff_role_permissions 
  FOR EACH ROW BEGIN
    IF NEW.id IS NULL THEN
      SET NEW.id=UUID();
    END IF;
  END;

DROP TRIGGER IF EXISTS files_before_insert;

CREATE TRIGGER files_before_insert BEFORE INSERT ON files 
  FOR EACH ROW BEGIN
    IF NEW.id IS NULL THEN
      SET NEW.id=UUID();
    END IF;
  END;

DROP TRIGGER IF EXISTS documents_before_insert;

CREATE TRIGGER documents_before_insert BEFORE INSERT ON documents 
  FOR EACH ROW BEGIN
    IF NEW.id IS NULL THEN
      SET NEW.id=UUID();
    END IF;
  END;

DROP TRIGGER IF EXISTS agriculture_ingredient_categories_before_insert;

CREATE TRIGGER agriculture_ingredient_categories_before_insert BEFORE INSERT ON agriculture_ingredient_categories 
  FOR EACH ROW BEGIN
    IF NEW.id IS NULL THEN
      SET NEW.id=UUID();
    END IF;
  END;

DROP TRIGGER IF EXISTS agriculture_ingredients_before_insert;

CREATE TRIGGER agriculture_ingredients_before_insert BEFORE INSERT ON agriculture_ingredients 
  FOR EACH ROW BEGIN
    IF NEW.id IS NULL THEN
      SET NEW.id=UUID();
    END IF;
  END;

DROP TRIGGER IF EXISTS agriculture_ingredient_category_links_before_insert;

CREATE TRIGGER agriculture_ingredient_category_links_before_insert BEFORE INSERT ON agriculture_ingredient_category_links 
  FOR EACH ROW BEGIN
    IF NEW.id IS NULL THEN
      SET NEW.id=UUID();
    END IF;
  END;

DROP TRIGGER IF EXISTS agriculture_product_categories_before_insert;

CREATE TRIGGER agriculture_product_categories_before_insert BEFORE INSERT ON agriculture_product_categories 
  FOR EACH ROW BEGIN
    IF NEW.id IS NULL THEN
      SET NEW.id=UUID();
    END IF;
  END;

DROP TRIGGER IF EXISTS agriculture_products_before_insert;

CREATE TRIGGER agriculture_products_before_insert BEFORE INSERT ON agriculture_products 
  FOR EACH ROW BEGIN
    IF NEW.id IS NULL THEN
      SET NEW.id=UUID();
    END IF;
  END;

DROP TRIGGER IF EXISTS agriculture_product_category_links_before_insert;

CREATE TRIGGER agriculture_product_category_links_before_insert BEFORE INSERT ON agriculture_product_category_links 
  FOR EACH ROW BEGIN
    IF NEW.id IS NULL THEN
      SET NEW.id=UUID();
    END IF;
  END;

DROP TRIGGER IF EXISTS pandemic_categories_before_insert;

CREATE TRIGGER pandemic_categories_before_insert BEFORE INSERT ON pandemic_categories 
  FOR EACH ROW BEGIN
    IF NEW.id IS NULL THEN
      SET NEW.id=UUID();
    END IF;
  END;

DROP TRIGGER IF EXISTS pandemics_before_insert;

CREATE TRIGGER pandemics_before_insert BEFORE INSERT ON pandemics 
  FOR EACH ROW BEGIN
    IF NEW.id IS NULL THEN
      SET NEW.id=UUID();
    END IF;
  END;

DROP TRIGGER IF EXISTS pandemic_category_links_before_insert;

CREATE TRIGGER pandemic_category_links_before_insert BEFORE INSERT ON pandemic_category_links 
  FOR EACH ROW BEGIN
    IF NEW.id IS NULL THEN
      SET NEW.id=UUID();
    END IF;
  END;

DROP TRIGGER IF EXISTS natural_events_before_insert;

CREATE TRIGGER natural_events_before_insert BEFORE INSERT ON natural_events 
  FOR EACH ROW BEGIN
    IF NEW.id IS NULL THEN
      SET NEW.id=UUID();
    END IF;
  END;

DROP TRIGGER IF EXISTS plans_before_insert;

CREATE TRIGGER plans_before_insert BEFORE INSERT ON plans 
  FOR EACH ROW BEGIN
    IF NEW.id IS NULL THEN
      SET NEW.id=UUID();
    END IF;
  END;

DROP TRIGGER IF EXISTS plan_products_before_insert;

CREATE TRIGGER plan_products_before_insert BEFORE INSERT ON plan_products 
  FOR EACH ROW BEGIN
    IF NEW.id IS NULL THEN
      SET NEW.id=UUID();
    END IF;
  END;

DROP TRIGGER IF EXISTS plan_orders_before_insert;

CREATE TRIGGER plan_orders_before_insert BEFORE INSERT ON plan_orders 
  FOR EACH ROW BEGIN
    IF NEW.id IS NULL THEN
      SET NEW.id=UUID();
    END IF;
  END;

DROP TRIGGER IF EXISTS plan_locations_before_insert;

CREATE TRIGGER plan_locations_before_insert BEFORE INSERT ON plan_locations 
  FOR EACH ROW BEGIN
    IF NEW.id IS NULL THEN
      SET NEW.id=UUID();
    END IF;
  END;

DROP TRIGGER IF EXISTS plan_staff_before_insert;

CREATE TRIGGER plan_staff_before_insert BEFORE INSERT ON plan_staff 
  FOR EACH ROW BEGIN
    IF NEW.id IS NULL THEN
      SET NEW.id=UUID();
    END IF;
  END;

DROP TRIGGER IF EXISTS categories_before_insert;

CREATE TRIGGER categories_before_insert BEFORE INSERT ON categories 
  FOR EACH ROW BEGIN
    IF NEW.id IS NULL THEN
      SET NEW.id=UUID();
    END IF;
  END;

DROP TRIGGER IF EXISTS products_before_insert;

CREATE TRIGGER products_before_insert BEFORE INSERT ON products 
  FOR EACH ROW BEGIN
    IF NEW.id IS NULL THEN
      SET NEW.id=UUID();
    END IF;
  END;

DROP TRIGGER IF EXISTS product_categories_before_insert;

CREATE TRIGGER product_categories_before_insert BEFORE INSERT ON product_categories 
  FOR EACH ROW BEGIN
    IF NEW.id IS NULL THEN
      SET NEW.id=UUID();
    END IF;
  END;

DROP TRIGGER IF EXISTS product_materials_before_insert;

CREATE TRIGGER product_materials_before_insert BEFORE INSERT ON product_materials 
  FOR EACH ROW BEGIN
    IF NEW.id IS NULL THEN
      SET NEW.id=UUID();
    END IF;
  END;

DROP TRIGGER IF EXISTS product_qr_code_indices_before_insert;

CREATE TRIGGER product_qr_code_indices_before_insert BEFORE INSERT ON product_qr_code_indices 
  FOR EACH ROW BEGIN
    IF NEW.id IS NULL THEN
      SET NEW.id=UUID();
    END IF;
  END;

DROP TRIGGER IF EXISTS product_packages_before_insert;

CREATE TRIGGER product_packages_before_insert BEFORE INSERT ON product_packages 
  FOR EACH ROW BEGIN
    IF NEW.id IS NULL THEN
      SET NEW.id=UUID();
    END IF;
  END;

DROP TRIGGER IF EXISTS orders_before_insert;

CREATE TRIGGER orders_before_insert BEFORE INSERT ON orders 
  FOR EACH ROW BEGIN
    IF NEW.id IS NULL THEN
      SET NEW.id=UUID();
    END IF;
  END;

DROP TRIGGER IF EXISTS order_items_before_insert;

CREATE TRIGGER order_items_before_insert BEFORE INSERT ON order_items 
  FOR EACH ROW BEGIN
    IF NEW.id IS NULL THEN
      SET NEW.id=UUID();
    END IF;
  END;

DROP TRIGGER IF EXISTS transfers_before_insert;

CREATE TRIGGER transfers_before_insert BEFORE INSERT ON transfers 
  FOR EACH ROW BEGIN
    IF NEW.id IS NULL THEN
      SET NEW.id=UUID();
    END IF;
  END;

DROP TRIGGER IF EXISTS transfer_items_before_insert;

CREATE TRIGGER transfer_items_before_insert BEFORE INSERT ON transfer_items 
  FOR EACH ROW BEGIN
    IF NEW.id IS NULL THEN
      SET NEW.id=UUID();
    END IF;
  END;

DROP TRIGGER IF EXISTS qr_codes_before_insert;

CREATE TRIGGER qr_codes_before_insert BEFORE INSERT ON qr_codes 
  FOR EACH ROW BEGIN
    IF NEW.id IS NULL THEN
      SET NEW.id=UUID();
    END IF;
  END;

DROP TRIGGER IF EXISTS qr_code_packages_before_insert;

CREATE TRIGGER qr_code_packages_before_insert BEFORE INSERT ON qr_code_packages 
  FOR EACH ROW BEGIN
    IF NEW.id IS NULL THEN
      SET NEW.id=UUID();
    END IF;
  END;

DROP TRIGGER IF EXISTS qr_code_materials_before_insert;

CREATE TRIGGER qr_code_materials_before_insert BEFORE INSERT ON qr_code_materials 
  FOR EACH ROW BEGIN
    IF NEW.id IS NULL THEN
      SET NEW.id=UUID();
    END IF;
  END;

DROP TRIGGER IF EXISTS gs1_glns_before_insert;

CREATE TRIGGER gs1_glns_before_insert BEFORE INSERT ON gs1_glns 
  FOR EACH ROW BEGIN
    IF NEW.id IS NULL THEN
      SET NEW.id=UUID();
    END IF;
  END;

DROP TRIGGER IF EXISTS gs1_ssccs_before_insert;

CREATE TRIGGER gs1_ssccs_before_insert BEFORE INSERT ON gs1_ssccs 
  FOR EACH ROW BEGIN
    IF NEW.id IS NULL THEN
      SET NEW.id=UUID();
    END IF;
  END;

DROP TRIGGER IF EXISTS gs1_grai_prefixes_before_insert;

CREATE TRIGGER gs1_grai_prefixes_before_insert BEFORE INSERT ON gs1_grai_prefixes 
  FOR EACH ROW BEGIN
    IF NEW.id IS NULL THEN
      SET NEW.id=UUID();
    END IF;
  END;

DROP TRIGGER IF EXISTS gs1_grais_before_insert;

CREATE TRIGGER gs1_grais_before_insert BEFORE INSERT ON gs1_grais 
  FOR EACH ROW BEGIN
    IF NEW.id IS NULL THEN
      SET NEW.id=UUID();
    END IF;
  END;

DROP TRIGGER IF EXISTS gs1_giais_before_insert;

CREATE TRIGGER gs1_giais_before_insert BEFORE INSERT ON gs1_giais 
  FOR EACH ROW BEGIN
    IF NEW.id IS NULL THEN
      SET NEW.id=UUID();
    END IF;
  END;

DROP TRIGGER IF EXISTS gs1_epcis_before_insert;

CREATE TRIGGER gs1_epcis_before_insert BEFORE INSERT ON gs1_epcis 
  FOR EACH ROW BEGIN
    IF NEW.id IS NULL THEN
      SET NEW.id=UUID();
    END IF;
  END;

DROP TRIGGER IF EXISTS data_syncs_before_insert;

CREATE TRIGGER data_syncs_before_insert BEFORE INSERT ON data_syncs 
  FOR EACH ROW BEGIN
    IF NEW.id IS NULL THEN
      SET NEW.id=UUID();
    END IF;
  END;

DROP TRIGGER IF EXISTS contract_types_before_insert;

CREATE TRIGGER contract_types_before_insert BEFORE INSERT ON contract_types 
  FOR EACH ROW BEGIN
    IF NEW.id IS NULL THEN
      SET NEW.id=UUID();
    END IF;
  END;

DROP TRIGGER IF EXISTS contracts_before_insert;

CREATE TRIGGER contracts_before_insert BEFORE INSERT ON contracts 
  FOR EACH ROW BEGIN
    IF NEW.id IS NULL THEN
      SET NEW.id=UUID();
    END IF;
  END;

DROP TRIGGER IF EXISTS system_histories_before_insert;

CREATE TRIGGER system_histories_before_insert BEFORE INSERT ON system_histories 
  FOR EACH ROW BEGIN
    IF NEW.id IS NULL THEN
      SET NEW.id=UUID();
    END IF;
  END;

DROP TRIGGER IF EXISTS networks_before_insert;

CREATE TRIGGER networks_before_insert BEFORE INSERT ON networks 
  FOR EACH ROW BEGIN
    IF NEW.id IS NULL THEN
      SET NEW.id=UUID();
    END IF;
  END;

DROP TRIGGER IF EXISTS procedures_before_insert;

CREATE TRIGGER procedures_before_insert BEFORE INSERT ON procedures 
  FOR EACH ROW BEGIN
    IF NEW.id IS NULL THEN
      SET NEW.id=UUID();
    END IF;
  END;

DROP TRIGGER IF EXISTS procedure_steps_before_insert;

CREATE TRIGGER procedure_steps_before_insert BEFORE INSERT ON procedure_steps 
  FOR EACH ROW BEGIN
    IF NEW.id IS NULL THEN
      SET NEW.id=UUID();
    END IF;
  END;

DROP TRIGGER IF EXISTS procedure_jobs_before_insert;

CREATE TRIGGER procedure_jobs_before_insert BEFORE INSERT ON procedure_jobs 
  FOR EACH ROW BEGIN
    IF NEW.id IS NULL THEN
      SET NEW.id=UUID();
    END IF;
  END;

DROP TRIGGER IF EXISTS production_processes_before_insert;

CREATE TRIGGER production_processes_before_insert BEFORE INSERT ON production_processes 
  FOR EACH ROW BEGIN
    IF NEW.id IS NULL THEN
      SET NEW.id=UUID();
    END IF;
  END;

DROP TRIGGER IF EXISTS production_process_steps_before_insert;

CREATE TRIGGER production_process_steps_before_insert BEFORE INSERT ON production_process_steps 
  FOR EACH ROW BEGIN
    IF NEW.id IS NULL THEN
      SET NEW.id=UUID();
    END IF;
  END;

DROP TRIGGER IF EXISTS meta_data_references_before_insert;

CREATE TRIGGER meta_data_references_before_insert BEFORE INSERT ON meta_data_references 
  FOR EACH ROW BEGIN
    IF NEW.id IS NULL THEN
      SET NEW.id=UUID();
    END IF;
  END;

DROP TRIGGER IF EXISTS meta_data_categories_before_insert;

CREATE TRIGGER meta_data_categories_before_insert BEFORE INSERT ON meta_data_categories 
  FOR EACH ROW BEGIN
    IF NEW.id IS NULL THEN
      SET NEW.id=UUID();
    END IF;
  END;

DROP TRIGGER IF EXISTS meta_data_before_insert;

CREATE TRIGGER meta_data_before_insert BEFORE INSERT ON meta_data 
  FOR EACH ROW BEGIN
    IF NEW.id IS NULL THEN
      SET NEW.id=UUID();
    END IF;
  END;

SET FOREIGN_KEY_CHECKS = 1;

COMMIT;
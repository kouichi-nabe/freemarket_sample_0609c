class Scraping
  def self.get_links
    agent = Mechanize.new
 
    current_page = agent.get('https://www.mercari.com/jp/category/')
    top_boxs = current_page.search('.category-list-individual-box')
 
    top_boxs.each do |ele|
      parent = ele.at('.category-list-individual-box-root-category-name h3')
      parent_name = parent.inner_text
 
      child_elements = ele.search('.category-list-individual-box-sub-category-name h4')
 
      grand_child_elements = ele.search('.category-list-individual-box-sub-sub-category-box')
 
      grand_child_array = []
      grand_child_elements.each do |ele|
        link = ele.search('.category-list-individual-box-sub-sub-category-name p a')
        grand_child_array << link
      end
 
      parent_recode = Category.where(name: parent_name).first_or_initialize
      parent_recode.save
 
      number = 0
 
      child_elements.each do |child|
        child_name = child.inner_text
        child_recode = ChildCategory.create(name: child_name, categories_id: parent_recode.id)
        # child_recode.name = child_name
        # child_recode.categories_id = parent_recode.id
        child_recode.save 
 
        grand_child = grand_child_array[number]
        grand_child.each do |ele|
          grand_child_name = ele.inner_text.gsub(/(\r\n|\r|\n)/, "").strip
          grand_child_recode = GrandChildCategory.create(name: grand_child_name, child_categories_id: child_recode.id)

          grand_child_recode.save
        end
 
        number += 1
      end
    end
  end
 end
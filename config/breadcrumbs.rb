crumb :root do
  link "Home", root_path
end

crumb :shipment_show do
  link "商品詳細", item_path(params[:item_id])
  parent :root
end

crumb :show do
  link "商品詳細", item_path(params[:id])
  parent :root
end

crumb :new do
  link "商品出品", new_item_path
  parent :root
end

crumb :edit do
  link "商品編集", edit_item_path
  parent :show
end

crumb :buy do
  link "商品購入", item_shipments_path
  parent :shipment_show
end

crumb :user_show do
  link "ユーザー詳細ページ", user_path(params[:id])
  parent :root
end

crumb :search do
  link "検索ページ", search_items_path
  parent :root
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).
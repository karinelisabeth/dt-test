class ItemsDatatable
  delegate :params, :h, :link_to, :number_to_currency, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
        sEcho: params[:sEcho].to_i,
        iTotalRecords: Item.count,
        iTotalDisplayRecords: items.total_entries,
        aaData: data
    }
  end

  private

  def data
    items.map do |item|
      [
          item.sku,
          link_to(item.name, item),
          number_to_currency(item.price),
          item.quantity
      ]
    end
  end

  def items
    @items ||= fetch_items
  end

  def fetch_items
    items = Item.order("#{sort_column} #{sort_direction}")
    items = items.page(page).per_page(per_page)
    if params[:sSearch].present?
      items = items.where("name like :search or sku like :search", search: "%#{params[:sSearch]}%")
    end
    items
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[sku name price quantity]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end
# frozen_string_literal: true

# Document
#
class WelcomeController < ApplicationController
  def index
    # build posting categories hash structure for search page
    @categorized_postings = {}
    POSTING_CATEGORIES.each { |c| @categorized_postings[c] = [] }

    postings = if params[:search].present?
                 Posting.search(params[:search])
                        .where(coins: [cookies[:coin].presence] || ['xmr'])
               else
                 # Fetch all postings within the last month
                 Posting.where(
                   created_at: (Time.now - 6.month)..Time.now,
                   coins: [cookies[:coin].presence] || ['xmr']
                 )
      end

    # Add postings to their respective category
    postings.each do |p|
      @categorized_postings[p.category] << p if p.category.present? && POSTING_CATEGORIES.include?(p.category)
    end

    # Clear out empty result categories
    @categorized_postings.delete_if { |_k, v| v.empty? }
  end

  def start_search
    # build service categories hash structure for search page
    @categorized_services = {}
    SERVICE_CATEGORIES.each { |c| @categorized_services[c] = [] }

    services = if params[:search].present?
                 Service.search(params[:search])
                        .where(coins: [cookies[:coin].presence] || ['xmr'])
               else
                 # Fetch all services within the last month
                 Service.where(
                   created_at: (Time.now - 6.month)..Time.now,
                   coins: [cookies[:coin].presence] || ['xmr']
                 )
      end

    # Add services to their respective category
    services.each do |p|
      @categorized_services[p.category] << p if p.category.present? && SERVICE_CATEGORIES.include?(p.category)
    end

    # Clear out empty result categories
    @categorized_services.delete_if { |_k, v| v.empty? }
  end

  def guidelines; end

  def privacy; end

  def terms; end
end

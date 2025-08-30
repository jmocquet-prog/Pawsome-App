import React, { useState, useEffect } from 'react';
import { Calendar, Users, BarChart3, Link2, FileText, Image, Settings, Plus, Search, Filter, Download, Bell, TrendingUp, DollarSign, Clock, CheckCircle, AlertCircle, Eye, Edit, Trash2, ExternalLink } from 'lucide-react';

const PawsomeManager = () => {
  const [activeTab, setActiveTab] = useState('dashboard');
  const [currentDate, setCurrentDate] = useState(new Date());
  
  // Sample data
  const [posts, setPosts] = useState([
    { id: 1, title: 'Morning Walk Adventure', platform: 'Instagram', status: 'Published', date: '2025-08-30', engagement: 1250 },
    { id: 2, title: 'Toy Review - Kong Classic', platform: 'TikTok', status: 'Scheduled', date: '2025-09-01', engagement: 0 },
    { id: 3, title: 'Training Tips Tuesday', platform: 'YouTube', status: 'Draft', date: '2025-09-03', engagement: 0 },
  ]);

  const [keywords, setKeywords] = useState([
    { id: 1, keyword: 'dog training tips', platform: 'YouTube', volume: 12000, competition: 'Medium', hashtags: '#dogtraining #puppytips' },
    { id: 2, keyword: 'best dog toys', platform: 'Instagram', volume: 8500, competition: 'High', hashtags: '#dogtoys #petproducts' },
    { id: 3, keyword: 'golden retriever', platform: 'TikTok', volume: 95000, competition: 'Low', hashtags: '#goldenretriever #dogsoftiktok' },
  ]);

  const [affiliateLinks, setAffiliateLinks] = useState([
    { id: 1, name: 'Kong Classic Dog Toy', program: 'Amazon Associates', clicks: 247, conversions: 12, revenue: 89.50, url: 'mydog.com/go/kong-classic' },
    { id: 2, name: 'Blue Buffalo Dog Food', program: 'Chewy', clicks: 156, conversions: 8, revenue: 124.20, url: 'mydog.com/go/blue-buffalo' },
    { id: 3, name: 'Dog Training Course', program: 'Rover', clicks: 89, conversions: 3, revenue: 67.80, url: 'mydog.com/go/training-course' },
  ]);

  const [brands, setBrands] = useState([
    { id: 1, name: 'PetSmart', contact: 'Sarah Johnson', email: 'sarah@petsmart.com', status: 'Partnered', lastContact: '2025-08-15', notes: 'Monthly toy reviews' },
    { id: 2, name: 'BarkBox', contact: 'Mike Chen', email: 'partnerships@barkbox.com', status: 'Pitched', lastContact: '2025-08-20', notes: 'Waiting for response on Q4 campaign' },
    { id: 3, name: 'Wellness Pet Food', contact: 'Emma Davis', email: 'emma@wellnesspet.com', status: 'Prospect', lastContact: '', notes: 'Potential food sponsor' },
  ]);

  // Dashboard metrics
  const totalRevenue = affiliateLinks.reduce((sum, link) => sum + link.revenue, 0);
  const totalClicks = affiliateLinks.reduce((sum, link) => sum + link.clicks, 0);
  const publishedPosts = posts.filter(post => post.status === 'Published').length;
  const scheduledPosts = posts.filter(post => post.status === 'Scheduled').length;

  const Dashboard = () => (
    <div className="space-y-6">
      <div className="flex justify-between items-center">
        <h1 className="text-3xl font-bold text-gray-900">Dashboard</h1>
        <div className="flex space-x-3">
          <button className="bg-purple-600 text-white px-4 py-2 rounded-lg hover:bg-purple-700 flex items-center space-x-2">
            <Plus size={20} />
            <span>New Post</span>
          </button>
        </div>
      </div>

      {/* Quick Stats */}
      <div className="grid grid-cols-1 md:grid-cols-4 gap-6">
        <div className="bg-gradient-to-r from-blue-500 to-blue-600 p-6 rounded-xl text-white">
          <div className="flex items-center justify-between">
            <div>
              <p className="text-blue-100">Monthly Revenue</p>
              <p className="text-2xl font-bold">${totalRevenue.toFixed(2)}</p>
            </div>
            <DollarSign size={32} className="text-blue-200" />
          </div>
        </div>
        
        <div className="bg-gradient-to-r from-green-500 to-green-600 p-6 rounded-xl text-white">
          <div className="flex items-center justify-between">
            <div>
              <p className="text-green-100">Total Clicks</p>
              <p className="text-2xl font-bold">{totalClicks.toLocaleString()}</p>
            </div>
            <TrendingUp size={32} className="text-green-200" />
          </div>
        </div>

        <div className="bg-gradient-to-r from-purple-500 to-purple-600 p-6 rounded-xl text-white">
          <div className="flex items-center justify-between">
            <div>
              <p className="text-purple-100">Published Posts</p>
              <p className="text-2xl font-bold">{publishedPosts}</p>
            </div>
            <CheckCircle size={32} className="text-purple-200" />
          </div>
        </div>

        <div className="bg-gradient-to-r from-orange-500 to-orange-600 p-6 rounded-xl text-white">
          <div className="flex items-center justify-between">
            <div>
              <p className="text-orange-100">Scheduled Posts</p>
              <p className="text-2xl font-bold">{scheduledPosts}</p>
            </div>
            <Clock size={32} className="text-orange-200" />
          </div>
        </div>
      </div>

      {/* Recent Activity */}
      <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
        <div className="bg-white p-6 rounded-xl shadow-sm border border-gray-200">
          <h3 className="text-lg font-semibold mb-4 flex items-center">
            <Calendar className="mr-2 text-purple-600" size={20} />
            Upcoming Posts
          </h3>
          <div className="space-y-3">
            {posts.filter(post => post.status !== 'Published').map(post => (
              <div key={post.id} className="flex items-center justify-between p-3 bg-gray-50 rounded-lg">
                <div>
                  <p className="font-medium">{post.title}</p>
                  <p className="text-sm text-gray-600">{post.platform} • {post.date}</p>
                </div>
                <span className={`px-2 py-1 rounded-full text-xs ${
                  post.status === 'Scheduled' ? 'bg-blue-100 text-blue-800' : 'bg-yellow-100 text-yellow-800'
                }`}>
                  {post.status}
                </span>
              </div>
            ))}
          </div>
        </div>

        <div className="bg-white p-6 rounded-xl shadow-sm border border-gray-200">
          <h3 className="text-lg font-semibold mb-4 flex items-center">
            <Link2 className="mr-2 text-green-600" size={20} />
            Top Performing Links
          </h3>
          <div className="space-y-3">
            {affiliateLinks.slice(0, 3).map(link => (
              <div key={link.id} className="flex items-center justify-between p-3 bg-gray-50 rounded-lg">
                <div>
                  <p className="font-medium">{link.name}</p>
                  <p className="text-sm text-gray-600">{link.clicks} clicks • {link.conversions} conversions</p>
                </div>
                <span className="text-green-600 font-semibold">${link.revenue.toFixed(2)}</span>
              </div>
            ))}
          </div>
        </div>
      </div>
    </div>
  );

  const ContentCalendar = () => (
    <div className="space-y-6">
      <div className="flex justify-between items-center">
        <h1 className="text-3xl font-bold text-gray-900">Content Calendar</h1>
        <div className="flex space-x-3">
          <button className="bg-white border border-gray-300 px-4 py-2 rounded-lg hover:bg-gray-50 flex items-center space-x-2">
            <Calendar size={20} />
            <span>Sync with Google Calendar</span>
          </button>
          <button className="bg-purple-600 text-white px-4 py-2 rounded-lg hover:bg-purple-700 flex items-center space-x-2">
            <Plus size={20} />
            <span>Schedule Post</span>
          </button>
        </div>
      </div>

      <div className="bg-white p-6 rounded-xl shadow-sm border border-gray-200">
        <div className="grid grid-cols-7 gap-4 mb-4">
          {['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'].map(day => (
            <div key={day} className="text-center font-semibold text-gray-600 p-3">{day}</div>
          ))}
        </div>
        
        <div className="grid grid-cols-7 gap-4">
          {Array.from({ length: 35 }, (_, i) => {
            const date = new Date(2025, 7, 26 + i);
            const dayPosts = posts.filter(post => post.date === date.toISOString().split('T')[0]);
            
            return (
              <div key={i} className="min-h-24 p-2 border border-gray-200 rounded-lg hover:bg-gray-50">
                <div className="text-sm font-medium text-gray-600 mb-2">{date.getDate()}</div>
                {dayPosts.map(post => (
                  <div key={post.id} className={`text-xs p-1 rounded mb-1 ${
                    post.status === 'Published' ? 'bg-green-100 text-green-800' :
                    post.status === 'Scheduled' ? 'bg-blue-100 text-blue-800' :
                    'bg-yellow-100 text-yellow-800'
                  }`}>
                    {post.title.substring(0, 15)}...
                  </div>
                ))}
              </div>
            );
          })}
        </div>
      </div>
    </div>
  );

  const SEOHub = () => (
    <div className="space-y-6">
      <div className="flex justify-between items-center">
        <h1 className="text-3xl font-bold text-gray-900">SEO & Keyword Hub</h1>
        <button className="bg-purple-600 text-white px-4 py-2 rounded-lg hover:bg-purple-700 flex items-center space-x-2">
          <Plus size={20} />
          <span>Add Keyword</span>
        </button>
      </div>

      <div className="bg-white p-6 rounded-xl shadow-sm border border-gray-200">
        <div className="flex justify-between items-center mb-4">
          <div className="flex space-x-4">
            <div className="relative">
              <Search size={20} className="absolute left-3 top-3 text-gray-400" />
              <input
                type="text"
                placeholder="Search keywords..."
                className="pl-10 pr-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-purple-500 focus:border-transparent"
              />
            </div>
            <select className="px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-purple-500 focus:border-transparent">
              <option>All Platforms</option>
              <option>Instagram</option>
              <option>TikTok</option>
              <option>YouTube</option>
              <option>Blog</option>
            </select>
          </div>
        </div>

        <div className="overflow-x-auto">
          <table className="w-full">
            <thead>
              <tr className="text-left border-b border-gray-200">
                <th className="pb-3 font-semibold text-gray-600">Keyword</th>
                <th className="pb-3 font-semibold text-gray-600">Platform</th>
                <th className="pb-3 font-semibold text-gray-600">Volume</th>
                <th className="pb-3 font-semibold text-gray-600">Competition</th>
                <th className="pb-3 font-semibold text-gray-600">Hashtags</th>
                <th className="pb-3 font-semibold text-gray-600">Actions</th>
              </tr>
            </thead>
            <tbody>
              {keywords.map(keyword => (
                <tr key={keyword.id} className="border-b border-gray-100">
                  <td className="py-4 font-medium">{keyword.keyword}</td>
                  <td className="py-4">
                    <span className="px-2 py-1 bg-gray-100 text-gray-800 rounded-full text-sm">
                      {keyword.platform}
                    </span>
                  </td>
                  <td className="py-4 text-gray-600">{keyword.volume.toLocaleString()}</td>
                  <td className="py-4">
                    <span className={`px-2 py-1 rounded-full text-sm ${
                      keyword.competition === 'Low' ? 'bg-green-100 text-green-800' :
                      keyword.competition === 'Medium' ? 'bg-yellow-100 text-yellow-800' :
                      'bg-red-100 text-red-800'
                    }`}>
                      {keyword.competition}
                    </span>
                  </td>
                  <td className="py-4 text-gray-600 text-sm">{keyword.hashtags}</td>
                  <td className="py-4">
                    <div className="flex space-x-2">
                      <button className="p-1 text-gray-400 hover:text-purple-600">
                        <Edit size={16} />
                      </button>
                      <button className="p-1 text-gray-400 hover:text-red-600">
                        <Trash2 size={16} />
                      </button>
                    </div>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </div>
    </div>
  );

  const AffiliateTracker = () => (
    <div className="space-y-6">
      <div className="flex justify-between items-center">
        <h1 className="text-3xl font-bold text-gray-900">Affiliate Marketing Tracker</h1>
        <button className="bg-purple-600 text-white px-4 py-2 rounded-lg hover:bg-purple-700 flex items-center space-x-2">
          <Plus size={20} />
          <span>Add Link</span>
        </button>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
        <div className="bg-white p-6 rounded-xl shadow-sm border border-gray-200">
          <div className="flex items-center justify-between mb-4">
            <h3 className="text-lg font-semibold">Total Revenue</h3>
            <DollarSign className="text-green-600" size={24} />
          </div>
          <p className="text-3xl font-bold text-green-600">${totalRevenue.toFixed(2)}</p>
          <p className="text-sm text-gray-600 mt-2">+12.5% from last month</p>
        </div>

        <div className="bg-white p-6 rounded-xl shadow-sm border border-gray-200">
          <div className="flex items-center justify-between mb-4">
            <h3 className="text-lg font-semibold">Total Clicks</h3>
            <TrendingUp className="text-blue-600" size={24} />
          </div>
          <p className="text-3xl font-bold text-blue-600">{totalClicks}</p>
          <p className="text-sm text-gray-600 mt-2">+8.3% from last month</p>
        </div>

        <div className="bg-white p-6 rounded-xl shadow-sm border border-gray-200">
          <div className="flex items-center justify-between mb-4">
            <h3 className="text-lg font-semibold">Conversion Rate</h3>
            <BarChart3 className="text-purple-600" size={24} />
          </div>
          <p className="text-3xl font-bold text-purple-600">4.7%</p>
          <p className="text-sm text-gray-600 mt-2">+0.8% from last month</p>
        </div>
      </div>

      <div className="bg-white p-6 rounded-xl shadow-sm border border-gray-200">
        <h3 className="text-lg font-semibold mb-4">Affiliate Links Performance</h3>
        <div className="overflow-x-auto">
          <table className="w-full">
            <thead>
              <tr className="text-left border-b border-gray-200">
                <th className="pb-3 font-semibold text-gray-600">Product</th>
                <th className="pb-3 font-semibold text-gray-600">Program</th>
                <th className="pb-3 font-semibold text-gray-600">Short URL</th>
                <th className="pb-3 font-semibold text-gray-600">Clicks</th>
                <th className="pb-3 font-semibold text-gray-600">Conversions</th>
                <th className="pb-3 font-semibold text-gray-600">Revenue</th>
                <th className="pb-3 font-semibold text-gray-600">Actions</th>
              </tr>
            </thead>
            <tbody>
              {affiliateLinks.map(link => (
                <tr key={link.id} className="border-b border-gray-100">
                  <td className="py-4 font-medium">{link.name}</td>
                  <td className="py-4">
                    <span className="px-2 py-1 bg-blue-100 text-blue-800 rounded-full text-sm">
                      {link.program}
                    </span>
                  </td>
                  <td className="py-4 font-mono text-sm text-gray-600">{link.url}</td>
                  <td className="py-4">{link.clicks}</td>
                  <td className="py-4">{link.conversions}</td>
                  <td className="py-4 font-semibold text-green-600">${link.revenue.toFixed(2)}</td>
                  <td className="py-4">
                    <div className="flex space-x-2">
                      <button className="p-1 text-gray-400 hover:text-blue-600">
                        <ExternalLink size={16} />
                      </button>
                      <button className="p-1 text-gray-400 hover:text-purple-600">
                        <Edit size={16} />
                      </button>
                      <button className="p-1 text-gray-400 hover:text-red-600">
                        <Trash2 size={16} />
                      </button>
                    </div>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </div>
    </div>
  );

  const BrandManager = () => (
    <div className="space-y-6">
      <div className="flex justify-between items-center">
        <h1 className="text-3xl font-bold text-gray-900">Brand Relationship Manager</h1>
        <button className="bg-purple-600 text-white px-4 py-2 rounded-lg hover:bg-purple-700 flex items-center space-x-2">
          <Plus size={20} />
          <span>Add Brand</span>
        </button>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
        <div className="bg-white p-6 rounded-xl shadow-sm border border-gray-200">
          <div className="flex items-center justify-between mb-4">
            <h3 className="text-lg font-semibold">Active Partners</h3>
            <Users className="text-green-600" size={24} />
          </div>
          <p className="text-3xl font-bold text-green-600">
            {brands.filter(b => b.status === 'Partnered').length}
          </p>
        </div>

        <div className="bg-white p-6 rounded-xl shadow-sm border border-gray-200">
          <div className="flex items-center justify-between mb-4">
            <h3 className="text-lg font-semibold">Pending Pitches</h3>
            <Clock className="text-yellow-600" size={24} />
          </div>
          <p className="text-3xl font-bold text-yellow-600">
            {brands.filter(b => b.status === 'Pitched').length}
          </p>
        </div>

        <div className="bg-white p-6 rounded-xl shadow-sm border border-gray-200">
          <div className="flex items-center justify-between mb-4">
            <h3 className="text-lg font-semibold">Prospects</h3>
            <Eye className="text-blue-600" size={24} />
          </div>
          <p className="text-3xl font-bold text-blue-600">
            {brands.filter(b => b.status === 'Prospect').length}
          </p>
        </div>
      </div>

      <div className="bg-white p-6 rounded-xl shadow-sm border border-gray-200">
        <h3 className="text-lg font-semibold mb-4">Brand Contacts</h3>
        <div className="overflow-x-auto">
          <table className="w-full">
            <thead>
              <tr className="text-left border-b border-gray-200">
                <th className="pb-3 font-semibold text-gray-600">Brand</th>
                <th className="pb-3 font-semibold text-gray-600">Contact</th>
                <th className="pb-3 font-semibold text-gray-600">Status</th>
                <th className="pb-3 font-semibold text-gray-600">Last Contact</th>
                <th className="pb-3 font-semibold text-gray-600">Notes</th>
                <th className="pb-3 font-semibold text-gray-600">Actions</th>
              </tr>
            </thead>
            <tbody>
              {brands.map(brand => (
                <tr key={brand.id} className="border-b border-gray-100">
                  <td className="py-4 font-medium">{brand.name}</td>
                  <td className="py-4">
                    <div>
                      <p className="font-medium">{brand.contact}</p>
                      <p className="text-sm text-gray-600">{brand.email}</p>
                    </div>
                  </td>
                  <td className="py-4">
                    <span className={`px-2 py-1 rounded-full text-sm ${
                      brand.status === 'Partnered' ? 'bg-green-100 text-green-800' :
                      brand.status === 'Pitched' ? 'bg-yellow-100 text-yellow-800' :
                      'bg-blue-100 text-blue-800'
                    }`}>
                      {brand.status}
                    </span>
                  </td>
                  <td className="py-4 text-gray-600">{brand.lastContact || 'Never'}</td>
                  <td className="py-4 text-gray-600 max-w-48 truncate">{brand.notes}</td>
                  <td className="py-4">
                    <div className="flex space-x-2">
                      <button className="p-1 text-gray-400 hover:text-purple-600">
                        <Edit size={16} />
                      </button>
                      <button className="p-1 text-gray-400 hover:text-green-600">
                        <Bell size={16} />
                      </button>
                      <button className="p-1 text-gray-400 hover:text-red-600">
                        <Trash2 size={16} />
                      </button>
                    </div>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </div>
    </div>
  );

  const MediaKit = () => (
    <div className="space-y-6">
      <div className="flex justify-between items-center">
        <h1 className="text-3xl font-bold text-gray-900">Media Kit Generator</h1>
        <button className="bg-green-600 text-white px-4 py-2 rounded-lg hover:bg-green-700 flex items-center space-x-2">
          <Download size={20} />
          <span>Download PDF</span>
        </button>
      </div>

      <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
        <div className="space-y-6">
          <div className="bg-white p-6 rounded-xl shadow-sm border border-gray-200">
            <h3 className="text-lg font-semibold mb-4">Profile Information</h3>
            <div className="space-y-4">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">Pet Name & Bio</label>
                <textarea 
                  className="w-full p-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-purple-500 focus:border-transparent"
                  rows={4}
                  placeholder="Meet Buddy, a 3-year-old Golden Retriever who loves adventures..."
                />
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">Owner/Handler</label>
                <input 
                  type="text"
                  className="w-full p-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-purple-500 focus:border-transparent"
                  placeholder="Your Name"
                />
              </div>
            </div>
          </div>

          <div className="bg-white p-6 rounded-xl shadow-sm border border-gray-200">
            <h3 className="text-lg font-semibold mb-4">Rates & Packages</h3>
            <div className="space-y-4">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">Instagram Post</label>
                <input 
                  type="number"
                  className="w-full p-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-purple-500 focus:border-transparent"
                  placeholder="250"
                />
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">Instagram Story</label>
                <input 
                  type="number"
                  className="w-full p-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-purple-500 focus:border-transparent"
                  placeholder="100"
                />
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">TikTok Video</label>
                <input 
                  type="number"
                  className="w-full p-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-purple-500 focus:border-transparent"
                  placeholder="300"
                />
              </div>
            </div>
          </div>
        </div>

        <div className="bg-white p-6 rounded-xl shadow-sm border border-gray-200">
          <h3 className="text-lg font-semibold mb-4">Live Metrics</h3>
          <div className="space-y-6">
            <div className="flex justify-between items-center p-4 bg-purple-50 rounded-lg">
              <div>
                <p className="font-medium">Instagram Followers</p>
                <p className="text-sm text-gray-600">@buddythegolden</p>
              </div>
              <p className="text-2xl font-bold text-purple-600">24.5K</p>
            </div>

            <div className="flex justify-between items-center p-4 bg-blue-50 rounded-lg">
              <div>
                <p className="font-medium">TikTok Followers</p>
                <p className="text-sm text-gray-600">@buddyvibes</p>
              </div>
              <p className="text-2xl font-bold text-blue-600">87.2K</p>
            </div>

            <div className="flex justify-between items-center p-4 bg-green-50 rounded-lg">
              <div>
                <p className="font-medium">Avg Engagement Rate</p>
                <p className="text-sm text-gray-600">Across all platforms</p>
              </div>
              <p className="text-2xl font-bold text-green-600">6.8%</p>
            </div>

            <div className="flex justify-between items-center p-4 bg-orange-50 rounded-lg">
              <div>
                <p className="font-medium">YouTube Subscribers</p>
                <p className="text-sm text-gray-600">Buddy's Adventures</p>
              </div>
              <p className="text-2xl font-bold text-orange-600">12.1K</p>
            </div>

            <div className="mt-6">
              <button className="w-full bg-purple-600 text-white py-3 rounded-lg hover:bg-purple-700 flex items-center justify-center space-x-2">
                <span>Refresh Metrics from APIs</span>
              </button>
            </div>
          </div>
        </div>
      </div>

      <div className="bg-white p-6 rounded-xl shadow-sm border border-gray-200">
        <h3 className="text-lg font-semibold mb-4">Media Kit Preview</h3>
        <div className="bg-gray-50 p-6 rounded-lg border-2 border-dashed border-gray-300 text-center">
          <FileText size={48} className="mx-auto text-gray-400 mb-4" />
          <p className="text-gray-600">Media kit preview will appear here</p>
          <p className="text-sm text-gray-500 mt-2">PDF will be generated with current data when downloaded</p>
        </div>
      </div>
    </div>
  );

  const ContentRepository = () => (
    <div className="space-y-6">
      <div className="flex justify-between items-center">
        <h1 className="text-3xl font-bold text-gray-900">Content Repository</h1>
        <div className="flex space-x-3">
          <button className="bg-white border border-gray-300 px-4 py-2 rounded-lg hover:bg-gray-50 flex items-center space-x-2">
            <Filter size={20} />
            <span>Filter</span>
          </button>
          <button className="bg-purple-600 text-white px-4 py-2 rounded-lg hover:bg-purple-700 flex items-center space-x-2">
            <Plus size={20} />
            <span>Upload Media</span>
          </button>
        </div>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-4 gap-6">
        <div className="bg-white p-4 rounded-xl shadow-sm border border-gray-200 text-center">
          <Image className="mx-auto text-blue-600 mb-3" size={32} />
          <p className="font-semibold">Photos</p>
          <p className="text-2xl font-bold text-blue-600">247</p>
        </div>
        
        <div className="bg-white p-4 rounded-xl shadow-sm border border-gray-200 text-center">
          <div className="w-8 h-8 bg-red-600 rounded mx-auto mb-3 flex items-center justify-center">
            <div className="w-3 h-3 bg-white rounded-full"></div>
          </div>
          <p className="font-semibold">Videos</p>
          <p className="text-2xl font-bold text-red-600">89</p>
        </div>

        <div className="bg-white p-4 rounded-xl shadow-sm border border-gray-200 text-center">
          <FileText className="mx-auto text-green-600 mb-3" size={32} />
          <p className="font-semibold">Contracts</p>
          <p className="text-2xl font-bold text-green-600">12</p>
        </div>

        <div className="bg-white p-4 rounded-xl shadow-sm border border-gray-200 text-center">
          <div className="w-8 h-8 bg-purple-600 rounded mx-auto mb-3 flex items-center justify-center">
            <div className="w-4 h-4 border-2 border-white rounded"></div>
          </div>
          <p className="font-semibold">Raw Footage</p>
          <p className="text-2xl font-bold text-purple-600">156</p>
        </div>
      </div>

      <div className="bg-white p-6 rounded-xl shadow-sm border border-gray-200">
        <div className="flex justify-between items-center mb-4">
          <h3 className="text-lg font-semibold">Recent Uploads</h3>
          <div className="flex space-x-2">
            <button className="px-3 py-1 bg-gray-100 text-gray-700 rounded-full text-sm">Grid</button>
            <button className="px-3 py-1 bg-purple-100 text-purple-700 rounded-full text-sm">List</button>
          </div>
        </div>
        
        <div className="grid grid-cols-2 md:grid-cols-4 lg:grid-cols-6 gap-4">
          {Array.from({ length: 12 }, (_, i) => (
            <div key={i} className="bg-gray-100 rounded-lg aspect-square flex items-center justify-center hover:bg-gray-200 cursor-pointer">
              <Image className="text-gray-400" size={32} />
            </div>
          ))}
        </div>
      </div>
    </div>
  );

  const renderContent = () => {
    switch (activeTab) {
      case 'dashboard': return <Dashboard />;
      case 'calendar': return <ContentCalendar />;
      case 'seo': return <SEOHub />;
      case 'affiliate': return <AffiliateTracker />;
      case 'brands': return <BrandManager />;
      case 'mediakit': return <MediaKit />;
      case 'repository': return <ContentRepository />;
      default: return <Dashboard />;
    }
  };

  return (
    <div className="min-h-screen bg-gray-50">
      {/* Sidebar */}
      <div className="fixed left-0 top-0 h-full w-64 bg-white shadow-lg border-r border-gray-200 z-10">
        <div className="p-6">
          <div className="flex items-center space-x-3 mb-8">
            <div className="w-10 h-10 bg-purple-600 rounded-xl flex items-center justify-center">
              <div className="w-6 h-6 bg-white rounded-full flex items-center justify-center">
                <div className="w-3 h-3 bg-purple-600 rounded-full"></div>
              </div>
            </div>
            <div>
              <h1 className="text-xl font-bold text-gray-900">Pawsome</h1>
              <p className="text-sm text-gray-600">Manager</p>
            </div>
          </div>

          <nav className="space-y-2">
            {[
              { id: 'dashboard', label: 'Dashboard', icon: BarChart3 },
              { id: 'calendar', label: 'Content Calendar', icon: Calendar },
              { id: 'seo', label: 'SEO Hub', icon: Search },
              { id: 'affiliate', label: 'Affiliate Tracker', icon: Link2 },
              { id: 'brands', label: 'Brand Manager', icon: Users },
              { id: 'mediakit', label: 'Media Kit', icon: FileText },
              { id: 'repository', label: 'Content Repository', icon: Image },
            ].map(item => {
              const Icon = item.icon;
              return (
                <button
                  key={item.id}
                  onClick={() => setActiveTab(item.id)}
                  className={`w-full flex items-center space-x-3 px-4 py-3 rounded-lg text-left transition-colors ${
                    activeTab === item.id
                      ? 'bg-purple-100 text-purple-700'
                      : 'text-gray-600 hover:bg-gray-100'
                  }`}
                >
                  <Icon size={20} />
                  <span className="font-medium">{item.label}</span>
                </button>
              );
            })}
          </nav>
        </div>

        <div className="absolute bottom-0 left-0 right-0 p-6 border-t border-gray-200">
          <button className="w-full flex items-center space-x-3 px-4 py-3 text-gray-600 hover:bg-gray-100 rounded-lg">
            <Settings size={20} />
            <span className="font-medium">Settings</span>
          </button>
        </div>
      </div>

      {/* Main Content */}
      <div className="ml-64 p-8">
        {renderContent()}
      </div>
    </div>
  );
};

export default PawsomeManager;
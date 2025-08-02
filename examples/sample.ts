// Sample TypeScript file to showcase the CargDev-Cyberpunk theme
// This demonstrates the vibrant cyberpunk color palette

import { useState, useEffect, useCallback } from 'react';
import type { User, ApiResponse } from './types';

// Interface definitions
interface UserProfile {
  id: string;
  name: string;
  email: string;
  avatar?: string;
  preferences: UserPreferences;
}

interface UserPreferences {
  theme: 'light' | 'dark';
  notifications: boolean;
  language: string;
}

// Type aliases
type UserStatus = 'active' | 'inactive' | 'pending';
type ApiMethod = 'GET' | 'POST' | 'PUT' | 'DELETE';

// Enums
enum UserRole {
  ADMIN = 'admin',
  USER = 'user',
  MODERATOR = 'moderator'
}

// Constants
const API_BASE_URL = 'https://api.example.com';
const DEFAULT_TIMEOUT = 5000;
const SUPPORTED_LANGUAGES = ['en', 'es', 'fr', 'de'] as const;

// Generic utility types
type ApiResponse<T> = {
  data: T;
  status: number;
  message: string;
  timestamp: Date;
};

type PaginatedResponse<T> = ApiResponse<T> & {
  pagination: {
    page: number;
    limit: number;
    total: number;
    hasNext: boolean;
  };
};

// Decorators
function log(target: any, propertyKey: string, descriptor: PropertyDescriptor) {
  const originalMethod = descriptor.value;
  
  descriptor.value = function (...args: any[]) {
    console.log(`Calling ${propertyKey} with:`, args);
    const result = originalMethod.apply(this, args);
    console.log(`Result:`, result);
    return result;
  };
  
  return descriptor;
}

// Class with decorators and generics
class UserService<T extends User> {
  private baseUrl: string;
  private timeout: number;

  constructor(baseUrl: string = API_BASE_URL, timeout: number = DEFAULT_TIMEOUT) {
    this.baseUrl = baseUrl;
    this.timeout = timeout;
  }

  @log
  async fetchUser(id: string): Promise<ApiResponse<T>> {
    const response = await fetch(`${this.baseUrl}/users/${id}`, {
      method: 'GET',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${this.getAuthToken()}`
      }
    });

    if (!response.ok) {
      throw new Error(`HTTP error! status: ${response.status}`);
    }

    return await response.json();
  }

  @log
  async createUser(userData: Partial<T>): Promise<ApiResponse<T>> {
    const response = await fetch(`${this.baseUrl}/users`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${this.getAuthToken()}`
      },
      body: JSON.stringify(userData)
    });

    if (!response.ok) {
      throw new Error(`HTTP error! status: ${response.status}`);
    }

    return await response.json();
  }

  private getAuthToken(): string {
    return localStorage.getItem('authToken') || '';
  }
}

// React component with hooks
function UserProfileComponent({ userId }: { userId: string }) {
  const [user, setUser] = useState<UserProfile | null>(null);
  const [loading, setLoading] = useState<boolean>(true);
  const [error, setError] = useState<string | null>(null);

  const userService = new UserService<UserProfile>();

  const fetchUserProfile = useCallback(async () => {
    try {
      setLoading(true);
      setError(null);
      
      const response = await userService.fetchUser(userId);
      setUser(response.data);
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Unknown error occurred');
    } finally {
      setLoading(false);
    }
  }, [userId, userService]);

  useEffect(() => {
    fetchUserProfile();
  }, [fetchUserProfile]);

  const handleUpdateProfile = async (updates: Partial<UserProfile>) => {
    try {
      setLoading(true);
      const response = await userService.createUser(updates);
      setUser(response.data);
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Failed to update profile');
    } finally {
      setLoading(false);
    }
  };

  if (loading) {
    return <div>Loading user profile...</div>;
  }

  if (error) {
    return <div className="error">Error: {error}</div>;
  }

  if (!user) {
    return <div>User not found</div>;
  }

  return (
    <div className="user-profile">
      <h1>{user.name}</h1>
      <p>Email: {user.email}</p>
      {user.avatar && <img src={user.avatar} alt="User avatar" />}
      <div className="preferences">
        <h2>Preferences</h2>
        <p>Theme: {user.preferences.theme}</p>
        <p>Notifications: {user.preferences.notifications ? 'Enabled' : 'Disabled'}</p>
        <p>Language: {user.preferences.language}</p>
      </div>
    </div>
  );
}

// Utility functions
function formatDate(date: Date): string {
  return date.toLocaleDateString('en-US', {
    year: 'numeric',
    month: 'long',
    day: 'numeric'
  });
}

function validateEmail(email: string): boolean {
  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  return emailRegex.test(email);
}

function debounce<T extends (...args: any[]) => any>(
  func: T,
  wait: number
): (...args: Parameters<T>) => void {
  let timeout: NodeJS.Timeout;
  
  return (...args: Parameters<T>) => {
    clearTimeout(timeout);
    timeout = setTimeout(() => func(...args), wait);
  };
}

// Export statements
export {
  UserService,
  UserProfileComponent,
  formatDate,
  validateEmail,
  debounce
};

export type {
  UserProfile,
  UserPreferences,
  UserStatus,
  ApiMethod,
  ApiResponse,
  PaginatedResponse
};

export { UserRole, SUPPORTED_LANGUAGES }; 